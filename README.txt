SYSMGR
--------------------------------------------------------------------------------

SYSMGR is a service manager for Linux written in POSIX shell. It reads the
service scripts from the given SYSDIR (which is '/var/sysmgr' by default) and
executes them asynchronously via RUNSYSSV. While exiting it sends a hangup
signal to all RUNSYSSV processes.


Directory structure
--------------------------------------------------------------------------------

    docs/  -- Documentation
    man/   -- Manual pages
    utils/ -- C programs
