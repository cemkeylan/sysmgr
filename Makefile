# See LICENSE for copyright information
VERSION  = 0.01.0

PREFIX   = /usr/local
BINDIR   = ${PREFIX}/bin
SHAREDIR = ${PREFIX}/share

LINK = runsyssv svctl

install:
	install -Dm755 sysmgr ${DESTDIR}${BINDIR}/sysmgr
	for link in ${LINK} ; do ln -sf sysmgr ${DESTDIR}${BINDIR}/$$link ; done

uninstall:
	rm -rf ${DESTDIR}${BINDIR}/sysmgr
	for link in ${LINK} ; do unlink ${DESTDIR}${BINDIR}/$$link ; done
