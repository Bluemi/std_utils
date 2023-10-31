#!/bin/bash

if [ -z "$1" ]; then
	echo -e "Usage:\ncreate_easyroam_cert <cert.p12>"
	echo "If you don't have any .p12 file, go to \"https://www.easyroam.de/Auth/Wayf?entityID=https://www.easyroam.de/shibboleth&return=https://www.easyroam.de/Shibboleth.sso/Login\" and create/download one"
	exit 1
fi

CERT="$1"

echo "### creating client cert ###"
echo "Bei Import Passwort einfach <Enter> drücken"
openssl pkcs12 -in "${CERT}" -legacy -nokeys > easyroam_client_cert.pem

echo -e "\n### creating client key ###"
echo "Bei Import Passwort einfach <Enter> drücken"
echo "Bei Passphrase ein Passwort festlegen"
openssl pkcs12 -legacy -in "${CERT}" -nodes -nocerts | openssl rsa -aes256 -out easyroam_client_key.pem

echo -e "\n### creating root cert ###"
echo "Bei Import Passwort einfach <Enter> drücken"
echo "Bei Passphrase oberes Passwort verwenden"
openssl pkcs12 -in "${CERT}" -legacy -cacerts > easyroam_root_ca.pem

echo -e "\n### extracting CN_NAME ###"
CN_NAME=$(openssl pkcs12 -info -in "${CERT}" -legacy -nodes 2> /dev/null | grep "subject=CN" | cut -d " " -f 3)
CN_NAME=${CN_NAME::-1}
echo "CN_NAME: ${CN_NAME}"

echo -e "\n### extracting netctl config \"easyroam\" ###"
echo "description='easyroam connection'" > easyroam
echo "Interface=wlan0" >> easyroam
echo "Connection=wireless" >> easyroam
echo "Security='wpa-configsection'" >> easyroam
echo "IP='dhcp'" >> easyroam
echo "WPAConfigSection=(" >> easyroam
echo "    'ssid=\"eduroam\"'" >> easyroam
echo "    'key_mgmt=WPA-EAP'" >> easyroam
echo "    'eap=TLS'" >> easyroam
echo "    'proto=WPA RSN'" >> easyroam
echo "    'identity=\"${CN_NAME}\"'   # Hier muss der CN (Common Name) aus dem easyroam Pseudozertifikat stehen!" >> easyroam
echo "    'client_cert=\"/etc/netctl/cert/easyroam_client_cert.pem\"'" >> easyroam
echo "    'private_key=\"/etc/netctl/cert/easyroam_client_key.pem\"'" >> easyroam
echo "    'private_key_passwd=\"PASSWORD\"'" >> easyroam
echo "    'ca_cert=\"/etc/netctl/cert/easyroam_root_ca.pem\"'" >> easyroam
echo "    'ca_cert2=\"/etc/netctl/cert/easyroam_root_ca.pem\"'" >> easyroam
echo ")" >> easyroam

mkdir -p cert
mv *.pem cert

echo -e "\nPlease replace PASSWORD in easyroam config"
