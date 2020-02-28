# See LICENSE for copyright information
PREFIX    = /usr/local
BINDIR    = ${PREFIX}/bin
MANPREFIX = ${PREFIX}/share/man

LINK = runsyssv svctl

install:
	install -Dm755 sysmgr ${DESTDIR}${BINDIR}/sysmgr
	for link in ${LINK} ; do ln -sf sysmgr ${DESTDIR}${BINDIR}/$$link ; done

uninstall:
	rm -rf ${DESTDIR}${BINDIR}/sysmgr
	for link in ${LINK} ; do unlink ${DESTDIR}${BINDIR}/$$link ; done
