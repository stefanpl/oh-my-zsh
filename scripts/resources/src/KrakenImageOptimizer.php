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
            $secretsFile = __DIR__.'../secrets.yml';
            if (!file_exists($secretsFile)) {
                throw new Exception('Could not find secrets.yml. Expected location: '.$secretsFile);
            }
            $secrets = Yaml::parse(file_get_contents($secretsFile));
            if (!isset($secrets['kraken-key'])) {
                throw new Exception('Please provide you kraken api key as "kraken-key" in secrets.yml');
            }
            if (!isset($secrets['kraken-secret'])) {
                throw new Exception('Please provide you kraken api secret as "kraken-secret" in secrets.yml');
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
     * @throws Exception if $imagePaths is not an array, of if it contains a non-existing file
     */
    public static function optimizeImages($imagePaths, $options = array())
    {
        if (!is_array($imagePaths)) {
            throw new Exception('First argument $imagePaths must be an array.');
        }
        // first check all the files
        foreach ($imagePaths as $imagePath) {
            if (!file_exists($imagePath)) {
                throw new Exception('Could not find the provided file: '.$imagePath);
            }
        }
        $params = array_merge(self::$defaultOptions, $options);
        // now optimize!
        foreach ($imagePaths as $imagePath) {
            $krakenResponse = self::getKraken()->upload(array_merge($params, array('file' => $imagePath)));
            // TODO: download images - overwrite vs prefix, collect savings
        }
    }

}