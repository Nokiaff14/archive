#!/usr/bin/bash
# version 4
X=1018
Y=1025
DELAY=10
START_TIME=$(date +%s)
CLICK_COUNT=0

# Colors ANSI
GREEN="\e[32m"
BLUE="\e[34m"
GRAY="\e[90m"
YELLOW="\e[33m"
RESET="\e[0m"

clear
echo ":3"
echo "autoclicker is running"
echo "position is under bs-card (i play as gsp 3nd div infatryman)"
echo "it clicks that once every 10 seconds"
echo "ignited since $(date '+%H:%M:%S, %d-%m-%Y')"
echo "press ctrl+c to stop"

elapsed_time() {
  local now=$(date +%s)
  local diff=$((now - START_TIME))
  local mins=$((diff / 60))
  local secs=$((diff % 60))
  printf "%02d:%02d" "$mins" "$secs"
}

# Cleanup when stopped (Ctrl+C or Ctrl+Z)
cleanup() {
  echo -e "\n${YELLOW} autoclicker rage quit :3${RESET}"
  [ -n "$TIMER_PID" ] && kill "$TIMER_PID" 2>/dev/null
  tput cnorm
  exit 0
}
trap cleanup INT TSTP TERM

# Hide cursor
tput civis

# Timer thread
(
  while true; do
    printf "\r${GRAY} real taim:${RESET} $(date '+%H:%M:%S')                      ${GREEN} elapsed taim:${RESET} $(elapsed_time)  "
    sleep 1
  done
) &
TIMER_PID=$!

# Click loop
while true; do
  xdotool mousemove $X $Y click 1
  CLICK_COUNT=$((CLICK_COUNT + 1))
  echo -e "\n${BLUE}[#${CLICK_COUNT}]${RESET} Click made at $(date '+%H:%M:%S')"
  sleep $DELAY
done
