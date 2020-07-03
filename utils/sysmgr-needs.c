/* See LICENSE for copyright information
 * sysmgr-needs -- tool to check service dependencies.
 */
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#include "util.h"

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("usage: %s [service...]\n", argv[0]);
    return 1;
  }

  int i;
  struct service sv;

  /* We are doing two iterations, because we want to exit as soon as possible if
   * any of the given services do not exist.
   */
  for (i = 1; i < argc; i++) {
    sv_init(&sv, argv[i]);
    if (access(sv.svfile, R_OK) == -1)
      die("sysmgr: service file for '%s' doesn't exist.", sv.name);
  }

  for (i = 1; i < argc; i++) {
    while(1) {
      int pid;
      
      sv_init(&sv, argv[i]);
      FILE *pidfile;
      
      pidfile = fopen(sv.pidfile, "r");
      if (pidfile != NULL) {
        fscanf(pidfile, "%d", &pid);
        fclose(pidfile);
        
        if (checkprocess(pid) == 0) break;
      }
      sleep(1);
    }
  }
}
