import sys
import time
import os
import shutil
import subprocess
#import re

#from sh arguments
load_average = sys.argv[1]
limit = sys.argv[2]

#local date and time
time_string = time.strftime("%d/%m/%Y, в %H:%M:%S", time.localtime())

#code to check correct work
if float(load_average) >= float(limit):
    ind = "ALERT"
else:
    ind = "NORMAL"
print("load average is: "+str(load_average)+" index: "+ind+" time: " + str(time_string))
check_uptime = subprocess.run('uptime')
#/code to check correct work

#work with logging
limitsize = 5
logscount = 5
if (os.path.isfile("average_log") == True):   #if logfile exist
    log_size = os.stat("average_log").st_size / 1024  #get logfile size in kilobites
    if (log_size >= limitsize):
       for currentFileNum in range(logscount, 1, -1):
           src = "average_log" + str(currentFileNum-1)
           dst = "average_log" + str(currentFileNum)
           if(os.path.isfile(src) == True):
               shutil.copyfile(src,dst)
       shutil.copyfile("average_log", "average_log"+"1")
       log_file = open("average_log", 'w')
       log_file.close()
#work with logging
