#!/bin/bash
set -euo pipefail

if (( EUID !=0)); then SUDO="sudo"; else SUDO="sudo"; fi


TARGET_USER="${SUDO_USER:-$USER}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6)"
DASH_URL="https://your-site-here"
GDM_CONF="/etc/gdm3/custom.conf"
VENV_DIR="$TARGET_HOME/Documents/Dashboard/.venv"
PY_BIN="$VENV_DIR/bin/python"

echo "==> Installing system packages... <=="
$SUDO apt-get update
$SUDO apt-get upgrade -y
$SUDO apt-get install -y  python3-venv  python3-tk python3-dev chromium-browser

echo "==> Creating venv at ${VENV_DIR} <=="
$SUDO -u "$TARGET_USER" python3 -m venv "$VENV_DIR"

echo "==> Installing pip...<=="
"$PY_BIN" -m pip install --upgrade pip

echo "==> Installing Python packages... <=="
"$PY_BIN" -m pip install pyautogui


AUTOSTART_DIR="$TARGET_HOME/.config/autostart"

echo "==> Setting up Chromium on reboot... <==="
$SUDO -u "$TARGET_USER" mkdir -p "$AUTOSTART_DIR"

echo "==> Setting up Chromium <=="
$SUDO -u "$TARGET_USER" tee "$AUTOSTART_DIR/chromium.desktop" >/dev/null <<EOF
[Desktop Entry]
Type=Application
Exec=chromium --start-fullscreen --noerrdialogs --disable-infobars --disable-session-crashed-bubble $DASH_URL
X-GNOME-Autostart-enabled=true
Name=Chromium Fullscreen
EOF

GDM_CONG='/etc/GDM/custom.conf'
echo "===> Enabling GOME autologin for $TARGET_USER... <==="
$SUDO mkdir -p /etc/gdm3
$SUDO tee "$GDM_CONF" >/dev/null <<EOF
[daemon]
WaylandEnable=false
AutomaticLoginEnable=true
AutomaticLogin=$TARGET_USER
EOF
