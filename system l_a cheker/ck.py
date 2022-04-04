import sys
import time
import os

average = sys.argv[1]
limit   = sys.argv[2]


named_tuple = time.localtime() 
time_string = time.strftime("%d/%m/%Y, в %H:%M:%S", named_tuple)

#code to check correct work
if float(average) >= float(limit):
    ind = "ALERT"
else:
    ind = "norm"
print("load average is: "+str(average)+" index: "+ind+" time: "+ str(time_string) )
#/code to check correct work

#work with logging


#work with logging
