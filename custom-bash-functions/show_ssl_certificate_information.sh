#!/bin/bash

###
# 
# Obtain information for a website's ssl certificate
# @param 1 – url where the certificate is delivered
#
###
show_ssl_certificate_information() {

    if [ -z "$1" ]; then
        echo "Provide a URL as the first argument"
        return 1
    fi

    # If the URL starts with a protocol, remove it
    url=`echo $1 | perl -p -e 's/^https?:\/\///'`

    curl --insecure -v https://$url 2>&1 | awk 'BEGIN { cert=0  } /^\* SSL connection/ { cert=1  } /^\*/ { if (cert) print  }'
}