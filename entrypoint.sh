#!/bin/bash

hub checkout master
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./app/build.gradle`
VERSION_CODE=`grep -oP ' (?<=versionCode\s)\d+' ./app/build.gradle`
FILENAME="${APP_NAME} - v${VERSION_NAME}-${VERSION_CODE}"
if [ ${TYPEPACKAGE}="release" ]; then
hub release create -a ./app/build/outputs/apk/google/release/"${FILENAME}.apk" -m "${APP_NAME} - v${VERSION_NAME}-${VERSION_CODE}" $(date +%Y%m%d%H%M%S)
elif [ ${TYPEPACKAGE}="debug" ]; then
curl -F "file=@app/build/outputs/apk/google/debug/${FILENAME}.apk" -F "_api_key=${CI_TOKEN}" https://www.pgyer.com/apiv2/app/upload
fi
