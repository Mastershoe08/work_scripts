import pyautogui
import time

# Just a line to get the corodinates on the screen. Need python3-tk

time.sleep(3)
currentMousesX, currentMousesY = pyautogui.position()
print(currentMousesX, currentMousesY)