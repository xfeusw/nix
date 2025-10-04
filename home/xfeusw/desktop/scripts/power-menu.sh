#!/usr/bin/env bash
set -euo pipefail

choice=$(printf "Lock\nLogout\nReboot\nShutdown" | wofi --dmenu --prompt "Power:")

case "$choice" in
  Lock) hyprlock ;;
  Logout) hyprctl dispatch exit ;;
  Reboot) systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac
