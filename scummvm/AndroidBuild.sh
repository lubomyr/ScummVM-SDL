#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`

# Hacks for broken configure scripts
#rm -rf $LOCAL_PATH/../../obj/local/armeabi/libSDL_*.so
#rm -rf $LOCAL_PATH/../../obj/local/armeabi/libsdl_main.so

# Uncomment if your configure expects SDL libraries in form "libSDL_name.so"
#if [ -e $LOCAL_PATH/../../obj/local/armeabi/libsdl_mixer.so ] ; then
#	ln -sf libsdl_mixer.so $LOCAL_PATH/../../obj/local/armeabi/libSDL_Mixer.so
#fi

#for F in $LOCAL_PATH/../../obj/local/armeabi/libsdl_*.so; do
#	LIBNAME=`echo $F | sed "s@$LOCAL_PATH/../../obj/local/armeabi/libsdl_\(.*\)[.]so@\1@"`
#	ln -sf libsdl_$LIBNAME.so $LOCAL_PATH/../../obj/local/armeabi/libSDL_$LIBNAME.so
#done

#ln -sf libtremor.a $LOCAL_PATH/../../../obj/local/armeabi/libvorbisidec.a
ln -sf libflac.a $LOCAL_PATH/../../../obj/local/armeabi/libFLAC.a
ln -sf libvorbis.a $LOCAL_PATH/../../../obj/local/armeabi/libvorbisfile.a
ln -sf libtheora.so $LOCAL_PATH/../../../obj/local/armeabi/libtheoradec.so
ln -sf libglshim.a $LOCAL_PATH/../../../obj/local/armeabi/libGL.a
ln -sf libflac.a $LOCAL_PATH/../../../obj/local/armeabi-v7a/libFLAC.a
ln -sf libvorbis.a $LOCAL_PATH/../../../obj/local/armeabi-v7a/libvorbisfile.a
ln -sf libtheora.so $LOCAL_PATH/../../../obj/local/armeabi-v7a/libtheoradec.so
ln -sf libglshim.a $LOCAL_PATH/../../../obj/local/armeabi-v7a/libGL.a

#if [ "$1" = armeabi ]; then
#if [ \! -f scummvm/config.mk ] ; then
#	../setEnvironment.sh sh -c "cd scummvm && env LIBS='-lflac -lvorbis -logg -lmad -lz -lgcc -ltheora -lpng -lfreetype -lgnustl_static' ./configure --host=androidsdl --enable-zlib --enable-vorbis --enable-mad --enable-flac --enable-png --enable-theoradec --enable-vkeybd --enable-verbose-build --disable-hq-scalers --disable-readline --disable-nasm --disable-mt32emu --disable-timidity --disable-fluidsynth --enable-all-engines --datadir=. "
#fi
#../setEnvironment.sh make -C scummvm -j2 && cp -f scummvm/scummvm libapplication.so
#fi

if [ "$1" = armeabi-v7a ]; then
if [ \! -f scummvm/config.mk ] ; then
	../setEnvironment-armeabi-v7a.sh sh -c "cd scummvm && env LIBS='-lflac -lvorbis -logg -lmad -lz -lgcc -ltheora -lpng -lfreetype -lfaad -lgnustl_static' ./configure --host=androidsdl --enable-zlib --enable-vorbis --enable-mad --enable-flac --enable-png --enable-theoradec --enable-vkeybd --enable-verbose-build --disable-hq-scalers --disable-readline --disable-nasm --disable-mt32emu --disable-timidity --disable-fluidsynth --enable-all-engines --disable-engine=sherlock --datadir=. "
fi
../setEnvironment-armeabi-v7a.sh make -C scummvm -j2 && cp -f scummvm/scummvm libapplication-armeabi-v7a.so
fi