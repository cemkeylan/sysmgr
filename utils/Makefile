CC  = cc

HDR = util.h
SRC = util.c sysmgr-needs.c
OBJ = ${SRC:.c=.o}
BIN = sysmgr-needs

all: ${BIN}

.c.o:
	${CC} ${CFLAGS} -c -o $@ $<

${BIN}: ${HDR} ${OBJ}
	${CC} ${LDFLAGS} -o $@ ${@:=.o} util.o

clean:
	rm -f ${OBJ} ${BIN}

.PHONY: all clean
