set remotetimeout 10
target extended-remote :3333
monitor gdb_breakpoint_override hard
break main

