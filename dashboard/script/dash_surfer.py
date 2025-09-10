"""
Example PyAutoGUI script for dashboard clicking.
Edit the X/Y coordinates and timing to match your dashboard layout.
This is just a sample — customize for your use case.
"""
# Manager wants this ones to cycle
# due, rush, idle, has app

import pyautogui
import time

time.sleep(3) # buffer before starting.

pyautogui.leftClick(x=110, y=301) #surgical guides
time.sleep(1)
pyautogui.leftClick(x=457, y=212) # active
time.sleep(180)
pyautogui.leftClick(x=110, y=301) #surgical guides
time.sleep(1)
pyautogui.leftClick(x=775, y=219) # hold
time.sleep(180)
pyautogui.leftClick(x=110, y=301) # surgical guides
time.sleep(1)
pyautogui.leftClick(x=1135, y=210) # rush
time.sleep(180)
pyautogui.leftClick(x=110, y=301) #surgical guides
time.sleep(1)
pyautogui.leftClick(x=1429, y=215) # Due date
time.sleep(180)
pyautogui.leftClick(x=110, y=301) # surgical guides
time.sleep(1)
pyautogui.leftClick(x=441, y=451) # Idle
time.sleep(180)
pyautogui.leftClick(x=110, y=301) # Surgical guides