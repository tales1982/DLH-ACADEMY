# Processes and Signals

Module covering Linux process management and signal handling — core concepts for system administration and security monitoring.

---

## Contents

| File | Description |
|------|-------------|
| `0-what-is-my-pid` | Displays the PID (Process ID) of the current shell |
| `1-list_your_processes` | Lists all currently running processes |
| `2-show_your_bash_pid` | Shows the PID of the running Bash session |
| `3-show_your_bash_pid_made_easy` | Alternative method to retrieve the Bash PID |
| `4-to_infinity_and_beyond` | Creates an infinite loop process for signal testing |
| `5-dont_stop_me_now` | Demonstrates a process resistant to the SIGTERM signal |
| `6-stop_me_if_you_can` | Sends signals to stop a running process |
| `67-stop_me_if_you_can` | Extended version of the signal sending script |
| `7-highlander` | Process that handles multiple signals and cannot be killed with SIGTERM |
| `8-beheaded_process` | Kills a process using SIGKILL |
| `9-process_and_pid_file` | Manages a process using a PID file |
| `10-manage_my_process` | Full process management script with start/stop/restart support |
| `manage_my_process` | Background daemon process managed by the control script |

---

## Skills Practiced

- Understanding Linux process lifecycle (creation, running, termination)
- Working with PIDs and process listing (`ps`, `pgrep`)
- Sending and handling Unix signals (`SIGTERM`, `SIGKILL`, `SIGHUP`)
- Managing background processes and PID files
- Writing daemon-style shell scripts
