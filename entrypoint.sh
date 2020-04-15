#!/bin/bash

hub checkout master
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./app/build.gradle`
VERSION_CODE=`grep -oP '(?<=versionCode\s)\d+' ./app/build.gradle`
FILENAME="${APP_NAME}-v${VERSION_NAME}-${VERSION_CODE}"
TYPEPAC=${TYPEPACKAGE}
echo ${TYPEPACKAGE}
hub release create -a ./app/build/outputs/apk/google/release/"${FILENAME}.apk" -m "${APP_NAME}-v${VERSION_NAME}-${VERSION_CODE}" $(date +%Y%m%d%H%M%S)
