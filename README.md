SYSMGR
--------------------------------------------------------------------------------

NOTE: The POSIX sh implementation of sysmgr has been deprecated. Here is the
[C99 implementation] which will receive updates and proper fixes. The reasoning
behind this change can be found [here].

SYSMGR is a service manager for Linux written in POSIX shell and simple C
utilities. It reads the service scripts from the given SYSDIR (which is
'/var/sysmgr' by default) and executes them asynchronously via RUNSYSSV. While
exiting it sends a hangup signal to all RUNSYSSV processes.


[C99 implementation]: https://git.ckyln.com/sm
[here]: https://cemkeylan.com/blog/20201002-reimplementing-sysmgr-in-c.html


Directory structure
--------------------------------------------------------------------------------

    docs/  -- Documentation
    man/   -- Manual pages
    utils/ -- C programs
