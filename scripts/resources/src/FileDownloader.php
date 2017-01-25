<?php

/**
 * Created by PhpStorm.
 * User: stefan
 * Date: 22.12.16
 * Time: 12:21
 */
class FileDownloader
{


    /**
     * @param $url - which file to download
     * @param $absoluteSavePath - where the file will be put
     * @param $overwriteExistingFile - if the given file exists, this must be set to true
     * @param $timeout - timeout in seconds
     */
    public static function getFile($url, $absoluteSavePath, $overwriteExistingFile = false, $timeout = 50)
    {
        set_time_limit(0);
        if (file_exists($absoluteSavePath) && !$overwriteExistingFile) {
            throw new Exception('File '.$absoluteSavePath.' already exists. 
            Please set $overwriteExistingFile if you want to replace it');
        }
        if (filter_var($url, FILTER_VALIDATE_URL) === FALSE) {
            throw new Exception('Not a valid URL: '.$url);
        }
        //This is the file where we save the    information
        $fp = fopen ($absoluteSavePath, 'w+');
        //Here is the file we are downloading, replace spaces with %20
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        // write curl response to file
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_exec($ch);
        curl_close($ch);
        fclose($fp);
    }

}