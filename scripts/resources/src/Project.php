<?php

/**
 * Created by PhpStorm.
 * User: stefan
 * Date: 18.12.16
 * Time: 14:20
 */
class Project
{

    /**
     * @var
     */
    protected $name;
    protected $options;
    protected $dbHandler;
    /**
     * Keep track if a vHost file has been written to avoid deleting existing config files
     * @var bool
     */
    protected $vHostWasCreated = false;
    protected static function defaultOptions() {
        return array(
            'projectURL' => '[NAME].local',
            'projectFolder' => getenv('HOME').'/webdev/[NAME]',
            'docroot' => getenv('HOME').'/webdev/[NAME]/public',
            'mysqlHost' => 'localhost',
            'mysqlUser' => 'root',
            'mysqlPassword' => 'root',
            'databaseName' => '[NAME]',
            'ignoreExisting' => array(),
            'apacheDirectory' => '/etc/apache2/sites-available',
            'hostsFile' => '/etc/hosts',
            'serverIP' => '127.0.0.1'
        );
    }

    public function __construct($name, $options = array())
    {
        $this->setName($name);
        $this->setOptions($options);
    }


    /**
     * Tries to create the project files and configurations
     * @param array $ignoreExisting - default behavior is to not proceed with project creation
     *  in case any of the components already exists. Set $ignoreExisting to proceed anyway.
     *  Possible values are 'all', 'database', 'db', 'folder', 'vhost', 'host'
     *
     */
    public function create($ignoreExisting = array())
    {
        $this->options['ignoreExisting'] = array_merge($this->options['ignoreExisting'], $ignoreExisting);
        try {
            $this->createProjectFolder();
            $this->createDatabase();
            $this->createVHost();
        } catch (Exception $exception) {
            echo 'Could not create the project: '.$exception->getMessage();
            $this->tidyUp();
        }
    }


    /**
     * Set options my merging defaults and given params, filling in placeholders
     * @param $options
     */
    public function setOptions($options)
    {
        $this->options = array_merge(self::defaultOptions(), $options);
        foreach ($this->options as $key => $value) {
            $this->options[$key] = str_replace('[NAME]', $this->name, $value);
        }
    }


    public function setName($name)
    {
        if (!$name || empty($name)) {
            throw new Exception('No name provided. Aborting.');
        }
        if (!preg_match('/^[-_a-z]+$/', $name)) {
            throw new Exception('Illegal project name: '.$name.'! Only [-_a-z] please');
        }
        $this->name = $name;
    }


    /**
     * Removes anything that might have been created in case something goes wrong
     */
    protected function tidyUp()
    {
        $this->removeProjectFolder();
        $this->removeDatabase();
        $this->removeVHost();
    }


    /**
     * @throws Exception if folder exists and $ignoreExisting is not set to "folder" or "all"
     */
    protected function createProjectFolder()
    {
        $folderName = $this->options['projectFolder'];
        if (is_dir($folderName)) {
            if (!in_array('folder', $this->options['ignoreExisting']) &&
                !in_array('all', $this->options['ignoreExisting'])) {
                throw new Exception('Folder '.$folderName.' already exists. Please set $ignoreExisting');
            }
            println('Folder '.$folderName.' already exists. $ignoreExisting is set - so we are proceeding');
        } else {
            mkdir($folderName);
        }
        return;
    }

    protected function removeProjectFolder()
    {
        $folderName = $this->options['projectFolder'];
        if (!is_dir($folderName)) {
            return;
        }
        if (!is_readable($folderName)) {
            println('Could not read folder data from '.$folderName);
            println('Leaving the folder untouched.');
        }
        if (!$this->directoryIsEmpty($folderName)) {
            println('Found files in folder '.$folderName);
            println('Leaving the folder untouched.');
        }
        rmdir($folderName);
    }

    protected function getDbHandler()
    {
        if (isset($this->dbHandler)) {
            return $this->dbHandler;
        }
        $dsn = 'mysql:host='.$this->options['mysqlHost'];
        return $this->dbHandler = new PDO($dsn, $this->options['mysqlUser'], $this->options['mysqlPassword']);
    }

    protected function createDatabase()
    {
        $createStatement = 'create database '.$this->options['databaseName'].' character set utf8 collate utf8_general_ci';
        $this->getDbHandler()->exec($createStatement);
    }

    protected function removeDatabase()
    {
        $removeStatement = 'drop database '.$this->options['databaseName'];
        $this->getDbHandler()->exec($removeStatement);
    }


    /**
     * Guess what it does
     * TODO: move to some helper class
     * @param $absoluteDirectoryPath
     * @return bool
     */
    protected function directoryIsEmpty($absoluteDirectoryPath)
    {
        $handle = opendir($absoluteDirectoryPath);
        if (!$handle) {
            throw new Exception('Could not get handle for directory: '.$absoluteDirectoryPath);
        }
        while (false !== ($entry = readdir($handle))) {
            if ($entry != "." && $entry != "..") {
                return false;
            }
        }
        return true;
    }


    protected function createVHost()
    {
        $apacheDirectory = $this->options['apacheDirectory'];
        if (!is_dir($apacheDirectory)) {
            throw new Exception('Could not find the assumed apache directory '.$apacheDirectory);
        }
        $filePath = $apacheDirectory.'/'.$this->name.'.conf';
        if (file_exists($filePath)) {
            if (!in_array('vhost', $this->options['ignoreExisting']) &&
                !in_array('host', $this->options['ignoreExisting']) &&
                !in_array('all', $this->options['ignoreExisting'])) {
                throw new Exception('vHost config already exists: '.$filePath.'. Please set $ignoreExisting');
            }
            println('Found vHost config '.$filePath.', but $ignoreExisting was set. Proceeding.');
        }
        $this->createConfFile($filePath);
        $this->editHostsFile();
        execAsSudo('a2ensite '.$this->name);
        execAsSudo('apachectl -k restart');
        return;
    }


    /**
     * Create the project.conf file for apache
     * @param String $confFileAbsolutePath
     */
    protected function createConfFile($confFileAbsolutePath)
    {
        $loader = new Twig_Loader_Filesystem(__DIR__.'/../');
        $twig = new Twig_Environment($loader, array());
        $vHostTemplate = $twig->load('vhost.conf.twig');
        $docroot = $this->options['docroot'];
        $domain = $this->options['projectURL'];
        $confFileContents = $vHostTemplate->render(array('docroot' => $docroot, 'domain' => $domain));
        $tmpFile = sys_get_temp_dir().'/tmpVhostConfFile';
        file_put_contents($tmpFile, $confFileContents);
        execAsSudo('cp '.$tmpFile.' '.$confFileAbsolutePath);
        unlink($tmpFile);
        $this->vHostWasCreated = true;
    }


    /**
     * Add the vhost to /etc/hosts
     */
    protected function editHostsFile()
    {
        $lineToPut = $this->options['serverIP']."\t".$this->options['projectURL'];
        $fileContents = file_get_contents($this->options['hostsFile']);
        if (strpos($fileContents, $lineToPut) === false) {
            $command = 'echo "'.$lineToPut.'" >> '.$this->options['hostsFile'];
            execAsSudo($command);
        }
    }


    protected function removeVHost()
    {
        if (!$this->vHostWasCreated) {
            return;
        }
        $apacheDirectory = $this->options['apacheDirectory'];
        $filePath = $apacheDirectory.'/'.$this->name.'.conf';
        execAsSudo('rm '.$filePath);
    }
}