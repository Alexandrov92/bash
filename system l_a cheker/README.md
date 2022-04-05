Run
$bash ck.sh

- ck.sh checks system load average, and when the specifide limit is exceeded, it logs  information about incident (create logfile automatically if exist) and runs ck.py.
- ck.py get some parameters from ck.sh, create message about incident (later it will be in Telgram-bot), and manage log file (create log files by 5kb and store the last 5 files) 
