# See LICENSE for copyright information
PREFIX    = /usr/local
BINDIR    = ${PREFIX}/bin
SHAREDIR  = ${PREFIX}/share
MANPREFIX = ${SHAREDIR}/man
MAN1      = ${MANPREFIX}/man1
MAN8      = ${MANPREFIX}/man8

LINK = runsyssv svctl

all: utils

utils:
	@${MAKE} -C utils

install: all
	mkdir -p ${DESTDIR}${BINDIR} ${DESTDIR}${MAN1} ${DESTDIR}${MAN8}
	cp sysmgr utils/sysmgr-needs utils/checkprocess ${DESTDIR}${BINDIR}
	chmod 755 ${DESTDIR}${BINDIR}/sysmgr
	chmod 755 ${DESTDIR}${BINDIR}/sysmgr-needs
	chmod 755 ${DESTDIR}${BINDIR}/checkprocess
	for link in ${LINK} ; do ln -sf sysmgr ${DESTDIR}${BINDIR}/$$link ; done
	cp man/svctl.1  ${DESTDIR}${MAN1}
	cp man/sysmgr.8 ${DESTDIR}${MAN8}
	chmod 644 ${DESTDIR}${MAN1}/svctl.1
	chmod 644 ${DESTDIR}${MAN8}/sysmgr.8

uninstall:
	rm -f ${DESTDIR}${BINDIR}/sysmgr \
		${DESTDIR}${BINDIR}/sysmgr-needs \
		${DESTDIR}${BINDIR}/checkprocess \
		${DESTDIR}${BINDIR}/svctl \
		${DESTDIR}${BINDIR}/runsyssv
	rm -f ${DESTDIR}${MANPREFIX}/man1/svctl.1 \
		${DESTDIR}${MANPREFIX}/man8/sysmgr.8

clean:
	@${MAKE} -C utils clean

.PHONY: all utils install uninstall clean
