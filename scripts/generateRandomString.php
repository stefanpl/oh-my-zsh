<?php

//generates a random string of characters from the given set of characters at a specific length
function generateRandomCharacterString($characters, $length) {
	$returnString = "";
	for($i = 0; $i<$length; $i++) {
		$randomNumber = rand(0, strlen($characters)-1);
		$returnString .= mb_substr($characters, $randomNumber, 1, 'UTF-8');
	}
	return $returnString;	
}

$characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ß@´!\"§$%&\\/()=?`äüöÖÄÜ+*~#'.:-_<>,;{}[]";

$length = (isset($argv[1]) && intval($argv[1]) > 0) ? intval($argv[1]) : 100;
echo generateRandomCharacterString($characters, $length);

?>
