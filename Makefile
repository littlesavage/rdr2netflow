CC?=gcc
#CFLAGS?= -O3 -pipe -DNDEBUG
CFLAGS=-W  -Wall -g -O0

DESTDIR?=/usr/local

all: rdr2netflow

clean:
	rm -f *.o rdr2netflow

rdr2netflow: rdr.h netflow.h repeater.h rdr.c repeater.c rdr2netflow.c
	$(CC) $(CFLAGS) $(LDFLAGS) rdr2netflow.c rdr.c repeater.c \
	   -o rdr2netflow

install:
	mkdir -p ${DESTDIR}/bin 2> /dev/null
	install -D -o root -g root -m 755 rdr2netflow ${DESTDIR}/bin

