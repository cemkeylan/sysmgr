# See LICENSE for copyright information
PREFIX    = /usr/local
BINDIR    = ${PREFIX}/bin
MANPREFIX = ${PREFIX}/share/man

LINK = runsyssv svctl

install:
	install -Dm755 sysmgr ${DESTDIR}${BINDIR}/sysmgr
	for link in ${LINK} ; do ln -sf sysmgr ${DESTDIR}${BINDIR}/$$link ; done
	install -Dm644 -t ${DESTDIR}${MANPREFIX}/man1 svctl.1
	install -Dm644 -t ${DESTDIR}${MANPREFIX}/man8 sysmgr.8

uninstall:
	rm -rf ${DESTDIR}${BINDIR}/sysmgr
	for link in ${LINK} ; do unlink ${DESTDIR}${BINDIR}/$$link ; done
