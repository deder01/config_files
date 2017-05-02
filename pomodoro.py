#!/usr/bin/env python
import subprocess
import time

pomodoroCount = 1
pomodoroMins = 25
breakMins = 5
longBreakMins = 20
while (True):
    print "Time get to work! On to pomodoro " + str(pomodoroCount) + "!"
    print pomodoroCount
    for i in range( 1, 5 ):
        print "Time for round " + str(i) + " of pomodoro " + str(pomodoroCount)
        focusCall = "open focus://focus?minutes=" + str(pomodoroMins)
        subprocess.call(focusCall, shell="True")
        time.sleep(pomodoroMins * 60)
        print "Finished round " + str(i) + " of pomodoro " + str(pomodoroCount) + " time for a short " + str(breakMins) + " min break"
        time.sleep(breakMins * 60)

    print "Finished pomodoro " + str(pomodoroCount) + " time for a well earned " + str(longBreakMins) + " min break!"
    pomodoroCount += 1
    time.sleep(longBreakMins * 60)
