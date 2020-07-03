/* See LICENSE for copyright information
 *
 * These are shared functions for utility programs. This may be used for a
 * library in the future.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <stdarg.h>
#include <errno.h>

#include "util.h"

extern int errno;

char *getenv_fallback(char *name, char *fallback) {
  char *value = getenv(name);
  if ( ! value ) value = fallback;
  return value;
}

service *sv_init(service *sv, char *sv_name) {
  sprintf(sv->name, "%s", sv_name);
  sprintf(sv->sysdir, "%s", getenv_fallback("SYSDIR", "/var/sysmgr"));
  sprintf(sv->rundir, "%s", getenv_fallback("RUNDIR", "/run/sysmgr"));
  sprintf(sv->pidfile, "%s/%s/pid", sv->rundir, sv->name);
  sprintf(sv->svfile, "%s/%s", sv->sysdir, sv_name);

  return sv;
}

void die(const char *msg, ...) {
  va_list ap;

  va_start(ap, msg);
  vfprintf(stderr, msg, ap);
  va_end(ap);

  if (msg[0] && msg[strlen(msg)-1] == ':') {
    fputc(' ', stderr);
    perror(NULL);
  } else {
    fputc('\n', stderr);
  }
  exit(1);
}

int checkprocess(int pid) {
  if (kill(pid, 0) == 0) return 0;
  else {

    switch (errno) {
    case 1:
      /*
       * Instead of a continuous loop, exit the program if we don't have the
       * permissions to check the process
       */
      die("kill:");
      break;
    default:
      perror("kill");
      break;
    }

    return 1;
  }
}
