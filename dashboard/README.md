# Dashboard Surfer Auto Clicker

This project automates clicks on a Chromium-based dashboard at login using Python + PyAutoGUI. It was designed to run on Raspberry Pi 5 using Ubuntu 22.04.

---

## 1. System Setup

1. Flash your micro SD card with [Raspberry Pi Imager](https://www.raspberrypi.com/software/) and install **Ubuntu**.

2. On the login screen, select **Xorg** (not Wayland).  
   - Click the gear icon in the bottom-right corner of the login screen and choose **Ubuntu on Xorg**.
3. Copy the `Dashboard` folder into: /home/<user>/Documents/
   - cd ~/Documents/Dashboard
   - chmod +x installer.sh
   - sudo ./installer.sh
   - cd scritp
   - chmod +x dash_surfer.py
   
   This script will:
   - Update apt and install required system packages
   - Set up a Python venv
   - Configure Chromium for fullscreen dashboard launch

4. sudo systemctl restart gdm3

5. Add the cronjobs: 
   - crontab -e
   - @reboot sleep 30 && DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 XAUTHORITY=/run/user/1000/gdm/Xauthority /home/<user>/Documents/Dashboard/.venv/bin/python /home/<user>/Documents/Dashboard/script/dash_surfer.py >> /home/<user>/Documents/Dashboard/dash_surfer.log 2>&1

6. Reboot — Chromium should open in fullscreen on the dashboard URL, and the auto-clicker will start automatically.

7. Add your own custom cronjob to run the script after however many minutes **/home/<user>/Documents/Dashboard/.venv/bin/python /home/<user>/Documents/Dashboard/script/dash_surfer.py**

**Optional:**
   - set Chromium as default browser
   - save a username/password to log into your website you'll be surfing

---

## 2. Editing `dash_surfer.py`

1. Run `mouse_pos.py` to print the X/Y coordinates for where you want clicks.  

2. Replace the placeholders in the script: pyautogui.leftClick(x=0, y=0)

3. Adjust time.sleep() values to tune the timing between clicks.

4. The installer adds a reboot cron job automatically. If you want an interval job as well, edit the crontab: crontab -e

5. Logs: All script output is logged to: ~/Documents/Dashboard/clicker.log

---

## Requirements:

- Ubuntu 25.04+ (Xorg session)
- Chromium browser
- Python 3.12+
- PyAutoGUI, Tk (installed via installer.sh)

---

## Known issues

- Double and triple check you are running on Xorg and not Wayland.
- This has been developed for Raspberry Pi 5 Running Ubuntu 25.04 and been tested on both Pi and x86 VM Ubuntu 25.04
- XDG_RUNTIME_DIR & XAUTHORITY:
   - Verify your user id with:
      - echo "$XDG_RUNTIME_DIR"
      - echo "$XAUTHORITY"
   

---

## Note on Style

This script is intentionally direct so anyone can tweak it quickly:

- Visivle clicks, steps and delays
- Easy to change coordinates/timings
- Written in a gritty style to demonstrate a real-world fix