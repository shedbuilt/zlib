#!/bin/bash
./configure --prefix=/usr
make -j $SHED_NUMJOBS
make "DESTDIR=${SHED_FAKEROOT}" install
mkdir -pv ${SHED_FAKEROOT}/lib
mv -v ${SHED_FAKEROOT}/usr/lib/libz.so.* ${SHED_FAKEROOT}/lib
ln -sfv ../../lib/$(readlink ${SHED_FAKEROOT}/usr/lib/libz.so) ${SHED_FAKEROOT}/usr/lib/libz.so
