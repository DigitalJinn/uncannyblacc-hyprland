#!/usr/bin/env bash
set -euo pipefail

# Default wallpaper preference order:
# 1) user-installed floral wallpaper (recommended)
# 2) repo-provided generated wallpaper
# 3) legacy SVG fallback
USER_WALL="$HOME/.local/share/uncannyblacc/wallpapers/uncannyblacc-user.jpg"
ALT_WALL="$HOME/.local/share/uncannyblacc/wallpapers/uncannyblacc-dark.jpg"
REPO_WALL="$HOME/.local/share/uncannyblacc/wallpapers/uncannyblacc-dark.svg"

TARGET=""
if [ -f "$USER_WALL" ]; then
  TARGET="$USER_WALL"
elif [ -f "$ALT_WALL" ]; then
  TARGET="$ALT_WALL"
elif [ -f "$REPO_WALL" ]; then
  TARGET="$REPO_WALL"
else
  TARGET="${1:-$HOME/.local/share/uncannyblacc/wallpapers/uncannyblacc-user.jpg}"
fi

if [ $# -gt 0 ]; then
  TARGET="$1"
fi

if command -v swww >/dev/null 2>&1; then
  swww img "$TARGET" --transition-type=wipe --transition-duration=0.5
elif command -v hyprpaper >/dev/null 2>&1; then
  hyprpaper --wallpaper "$TARGET"
else
  swaybg -i "$TARGET" -m fill
fi
