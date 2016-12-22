<?php

use Symfony\Component\Yaml\Yaml as Yaml;

/**
 * Created by PhpStorm.
 * User: stefan
 * Date: 21.12.16
 * Time: 10:06
 */
class KrakenImageOptimizer
{
    protected static $defaultOptions = array(
        'wait' => true,
        'lossy' => true
    );

    protected static $kraken = null;


    /**
     * Create a kraken instance with api key and secret from secrets.yml
     * @return Kraken
     * @throws Exception if secrets.yml is not found or key/secret missing
     */
    protected static function getKraken()
    {
        if (!isset(self::$kraken)) {
            $secretsFile = __DIR__.'/../secrets.yml';
            if (!file_exists($secretsFile)) {
                throw new Exception('Could not find secrets.yml. Expected location: '.$secretsFile);
            }
            $secrets = Yaml::parse(file_get_contents($secretsFile));
            if (!isset($secrets['kraken-key'])) {
                throw new Exception('Please provide your kraken api key as "kraken-key" in secrets.yml');
            }
            if (!isset($secrets['kraken-secret'])) {
                throw new Exception('Please provide your kraken api secret as "kraken-secret" in secrets.yml');
            }
            self::$kraken = new Kraken($secrets['kraken-key'], $secrets['kraken-secret']);
        }
        return self::$kraken;
    }


    /**
     * TODO: overwrite file vs. prefix file
     * TODO: separate function to just do one file
     * @param array $imagePaths - absolute paths to images which shall be optimized
     * @param array $options
     * @param boolean $replace - if true, existing images will be replaced.
     *  Otherwise, they will be prefixed with 'krakenized_'
     * @throws Exception if $imagePaths is not an array, of if it contains a non-existing file
     */
    public static function optimizeImages($imagePaths, $replace = false, $options = array())
    {
        if (!is_array($imagePaths)) {
            $imagePaths = array($imagePaths);
        }
        // first check all the files
        foreach ($imagePaths as $imagePath) {
            if (!file_exists($imagePath)) {
                throw new Exception('Could not find the provided file: '.$imagePath);
            }
        }
        $params = array_merge(self::$defaultOptions, $options);
        $optimized = array();
        // now optimize!
        foreach ($imagePaths as $imagePath) {
            $krakenResponse = self::getKraken()->upload(array_merge($params, array('file' => $imagePath)));
            if ($krakenResponse['success'] !== true) {
                throw new Exception('Could not kraken image '.$imagePath.'. Kraken Response: '.print_r($krakenResponse, true));
            }
            $newImagePath = $replace ? $imagePath : self::prefixFilename($imagePath, 'krakenized_');
            $downloadUrl = str_replace(' ', '%20', $krakenResponse['kraked_url']);
            FileDownloader::getFile($downloadUrl, $newImagePath, true);
            $optimized[] = array('file' => $imagePath.' => '.$newImagePath, 'savings' => $krakenResponse['saved_bytes']);
        }
        return $optimized;
    }


    /**
     * Prefixes a given file - absolute or relative path
     * @param $filePath - relative or absolute path to the file
     * @param $prefix
     * @return String $filePath
     */
    protected static function prefixFilename($filePath, $prefix)
    {
        return preg_replace('/([^\/]+)$/', $prefix.'$1', $filePath);
    }

}