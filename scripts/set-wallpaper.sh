#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-$HOME/.local/share/uncannyblacc/wallpapers/uncannyblacc-dark.svg}"

if command -v swww >/dev/null 2>&1; then
  swww img "$TARGET" --transition-type=wipe --transition-duration=0.5
elif command -v hyprpaper >/dev/null 2>&1; then
  hyprpaper --wallpaper "$TARGET"
else
  swaybg -i "$TARGET" -m fill
fi
