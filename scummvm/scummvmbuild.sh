#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`

cd ~
cd androidsdl
cd project/jni/application
rm src
ln -s scummvm src
cd scummvm
./DataBuild.sh
cd ../../../..
./ChangeAppSettings.sh -a
./build.sh