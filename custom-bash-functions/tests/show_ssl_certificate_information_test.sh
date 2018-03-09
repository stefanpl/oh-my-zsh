#!/bin/bash
scriptDirectory=$( dirname ${BASH_SOURCE[0]} )
cd $scriptDirectory/..

source show_ssl_certificate_information.sh

cmd0="show_ssl_certificate_information" 
echo "Running '${cmd0}'"
${cmd0}

cmd1="show_ssl_certificate_information google.de" 
echo "Running '${cmd1}'"
${cmd1}

cmd2="show_ssl_certificate_information https://google.de" 
echo "Running '${cmd2}'"
${cmd2}