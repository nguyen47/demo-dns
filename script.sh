DOMAIN=$1
SSL_CERTIFICATE_DIR=$2
SETUP_SSL_LOCATION=$3

# If the file is exists, then we delete the file, and copy the example file and insert the content into the new file.
# If the file is not exists, then we just copy the example file and insert the content
if test -f "$SETUP_SSL_LOCATION"; 
then
    rm ${SETUP_SSL_LOCATION}
    cp example www.${DOMAIN}.conf
    sed -i -e "s/SERVER_NAME/$DOMAIN/g" www.${DOMAIN}.conf
else
    cp example www.${DOMAIN}.conf
    sed -i -e "s/SERVER_NAME/$DOMAIN/g" www.${DOMAIN}.conf
fi


# Next, we are going the check the if this domain is already run cert bot.
# If the domain is already had certbot, then we just need to try to reinstall it
if [ -d "$SSL_CERTIFICATE_DIR" ];
then
    certbot -d ${DOMAIN} -d www.${DOMAIN} --reinstall --redirect 
else 
    certbot -d ${DOMAIN} -d www.${DOMAIN} --redirect
fi
