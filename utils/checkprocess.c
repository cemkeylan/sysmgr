/* See LICENSE for copyright information */
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <libgen.h>

#include "util.h"

static char *argv0;

void
usage(void)
{
	fprintf(stderr, "usage: %s [pid]\n", argv0);
	exit(1);
}

int
main(int argc, char *argv[])
{
	argv0 = basename(argv[0]);
	int pid;

	if (!argv[1] || sscanf(argv[1], "%d", &pid) != 1)
		usage();

	if (checkprocess(pid) == 0)
		return 0;
	else
		return 1;
}
