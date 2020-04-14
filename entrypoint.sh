#!/bin/bash

hub checkout master
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./${APP_FOLDER}/build.gradle`
APP_NAME=`grep -oP 'appName "\K(.*?)(?=")' ./${APP_FOLDER}/build.gradle`
VERSION_CODE=`grep -oP 'versionCode "\K(.*?)(?=")' ./${APP_FOLDER}/build.gradle`
hub release create -a ./${APP_FOLDER}/build/outputs/apk/google/debug/spendingtracker_v1.0_debug.apk -m "${RELEASE_TITLE} - v${VERSION_NAME}" $(date +%Y%m%d%H%M%S)
curl -F 'file=@app/build/outputs/apk/google/debug/spendingtracker_v1.0_debug.apk' -F '_api_key=c223e000588468f5a50ad58bf40a20f4' https://www.pgyer.com/apiv2/app/upload
