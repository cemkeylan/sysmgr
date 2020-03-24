# See LICENSE for copyright information
PREFIX    = /usr/local
BINDIR    = ${PREFIX}/bin
SHAREDIR  = ${PREFIX}/share
MANPREFIX = ${SHAREDIR}/man

LINK = runsyssv svctl

install:
	install -Dm755 -t ${DESTDIR}${BINDIR} sysmgr utils/sysmgr-needs
	for link in ${LINK} ; do ln -sf sysmgr ${DESTDIR}${BINDIR}/$$link ; done
	install -Dm644 -t ${DESTDIR}${MANPREFIX}/man1 man/svctl.1
	install -Dm644 -t ${DESTDIR}${MANPREFIX}/man8 man/sysmgr.8

uninstall:
	rm -f ${DESTDIR}${BINDIR}/sysmgr ${DESTDIR}${BINDIR}/sysmgr-needs
	for link in ${LINK} ; do unlink ${DESTDIR}${BINDIR}/$$link ; done
	rm -f \
		${DESTDIR}${MANPREFIX}/man1/svctl.1 \
		${DESTDIR}${MANPREFIX}/man8/sysmgr.8
