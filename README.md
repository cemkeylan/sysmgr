SYSMGR
--------------------------------------------------------------------------------

NOTE: I am working on a _C version of_ sysmgr. While it works at its current
state, I have been shown that it isn't the most efficient solution. After
writing small C utilities to make sysmgr more efficient than it is, I understood
that rather than doing an ugly C/Shell hybrid, I should do it completely C
based. [Here] is a better explanation. See: <https://git.ckyln.com/sm>

SYSMGR is a service manager for Linux written in POSIX shell and simple C
utilities. It reads the service scripts from the given SYSDIR (which is
'/var/sysmgr' by default) and executes them asynchronously via RUNSYSSV. While
exiting it sends a hangup signal to all RUNSYSSV processes.


[Here]: https://cemkeylan.com/blog/20201002-reimplementing-sysmgr-in-c.html


Directory structure
--------------------------------------------------------------------------------

    docs/  -- Documentation
    man/   -- Manual pages
    utils/ -- C programs
