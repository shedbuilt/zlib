#!/bin/bash
./configure --prefix=/usr &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install &&
mkdir -pv "${SHED_FAKE_ROOT}/lib" &&
mv -v ${SHED_FAKE_ROOT}/usr/lib/libz.so.* "${SHED_FAKE_ROOT}/lib" &&
ln -sfv ../../lib/$(readlink "${SHED_FAKE_ROOT}/usr/lib/libz.so") "${SHED_FAKE_ROOT}/usr/lib/libz.so"
