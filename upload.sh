#!/bin/sh

BUILD_DIR=./build
BUILD_ISO_DIR=${BUILD_DIR}/html/
BUILD_UTF8_DIR=${BUILD_DIR}/html.utf8/

WWW_HOST=www.chorusroom.org
WWW_DIR=/home/www/data
WWW_ISO_DIR=${WWW_DIR}/chorusRoom/
WWW_UTF8_DIR=${WWW_DIR}/chorusRoom.utf8/

rsync -avuIz -e ssh ${BUILD_ISO_DIR} ${WWW_HOST}:${WWW_ISO_DIR}
#rsync -avuIz -e ssh ${BUILD_UTF8_DIR} ${WWW_HOST}:${WWW_UTF8_DIR}
