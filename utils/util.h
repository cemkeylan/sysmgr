/* See LICENSE for copyright information
 *
 * Common functions that may be used for future C utilities
 */

#include <limits.h>

typedef struct service {
  char name[NAME_MAX];
  char sysdir[PATH_MAX];
  char rundir[PATH_MAX];
  char pidfile[PATH_MAX];
  char svfile[PATH_MAX];
} service;

/*
 * Get information about the service.
 */
service *sv_init(service *sv, char *sv_name);

/*
 * Check whether the given pid exists.
 */
int checkprocess(int pid);

/*
 * Get environment variable while setting a fallback
 */
char *getenv_fallback(char *name, char *fallback);

/*
 * Exit program while printing a message
 */
void die(const char *msg, ...);
