#!/bin/bash
APP_NAME="internship"
OPT_DIR="/opt/${APP_NAME}"
ETC_DIR="/etc/${APP_NAME}"
DOMAIN="${APP_NAME}.creapy.cz"
VERSION=$(cat version)

set -x

cp -r ./dpkg /tmp

mkdir -p /tmp/dpkg/${OPT_DIR}/
mkdir -p /tmp/dpkg/lib/systemd/system/

cp -r ./* /tmp/dpkg/${OPT_DIR}/
cp /tmp/dpkg/${OPT_DIR}/services/* /tmp/dpkg/lib/systemd/system/
chmod 775 /tmp/dpkg/DEBIAN/*
cd /tmp/dpkg/DEBIAN/
sh control.sh ${VERSION}
rm control.sh



dpkg-deb --build /tmp/dpkg/ /tmp/${APP_NAME}_${VERSION}_amd64.deb &> logfile

cat logfile