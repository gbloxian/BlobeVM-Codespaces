echo "**** install steam ****"
apt-get update
wget "https://steamcdn-a.akamaihd.net/client/installer/steam.deb" -O /tmp/steam.deb
apt-get install -y /tmp/steam.deb
rm /tmp/steam.deb
