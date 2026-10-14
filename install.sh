#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_CONFIG_DIR="$HOME/.config"
HOME_SHARE_DIR="$HOME/.local/share/uncannyblacc"
BACKUP_DIR="$HOME/.config/backup-uncannyblacc-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$HOME/.config" "$HOME_SHARE_DIR"

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -a "$target" "$BACKUP_DIR/$(basename "$target")"
    rm -rf "$target"
  fi
}

backup_if_exists "$HOME_CONFIG_DIR/alacritty"
backup_if_exists "$HOME_CONFIG_DIR/hyprland"
backup_if_exists "$HOME_CONFIG_DIR/waybar"
backup_if_exists "$HOME_CONFIG_DIR/swaylock"
backup_if_exists "$HOME_CONFIG_DIR/sddm"
backup_if_exists "$HOME_CONFIG_DIR/starship.toml"
backup_if_exists "$HOME_CONFIG_DIR/dunst"

mkdir -p "$HOME_CONFIG_DIR/alacritty" "$HOME_CONFIG_DIR/hyprland" "$HOME_CONFIG_DIR/waybar" "$HOME_CONFIG_DIR/swaylock" "$HOME_CONFIG_DIR/sddm" "$HOME_CONFIG_DIR/dunst"

cp -a "$REPO_DIR/.config/alacritty/." "$HOME_CONFIG_DIR/alacritty/"
cp -a "$REPO_DIR/.config/hyprland/." "$HOME_CONFIG_DIR/hyprland/"
cp -a "$REPO_DIR/.config/waybar/." "$HOME_CONFIG_DIR/waybar/"
cp -a "$REPO_DIR/.config/swaylock/." "$HOME_CONFIG_DIR/swaylock/"
cp -a "$REPO_DIR/.config/sddm/." "$HOME_CONFIG_DIR/sddm/"
cp -a "$REPO_DIR/.config/starship.toml" "$HOME_CONFIG_DIR/starship.toml"
cp -a "$REPO_DIR/.config/dunst/." "$HOME_CONFIG_DIR/dunst/"

mkdir -p "$HOME_SHARE_DIR/wallpapers" "$HOME_SHARE_DIR/icons"
cp -a "$REPO_DIR/assets/wallpapers/." "$HOME_SHARE_DIR/wallpapers/"
cp -a "$REPO_DIR/assets/icons/." "$HOME_SHARE_DIR/icons/"

mkdir -p "$HOME/.local/bin"
cp -a "$REPO_DIR/scripts/set-wallpaper.sh" "$HOME/.local/bin/set-wallpaper.sh"
chmod +x "$HOME/.local/bin/set-wallpaper.sh"

cat > "$HOME/.config/hyprland/scripts/set-wallpaper.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-$HOME/.local/share/uncannyblacc/wallpapers/uncannyblacc-dark.svg}"

if command -v swww >/dev/null 2>&1; then
  swww img "$TARGET" --transition-type=wipe --transition-duration=0.5
elif command -v hyprpaper >/dev/null 2>&1; then
  hyprpaper --wallpaper "$TARGET"
else
  echo "No wallpaper setter found (swww/hyprpaper)."
fi
EOF
chmod +x "$HOME/.config/hyprland/scripts/set-wallpaper.sh"

if command -v systemctl >/dev/null 2>&1; then
  echo "Install complete. For system-wide SDDM, copy ~/.config/sddm/* into /etc/sddm.conf.d/ or the system theme directory."
else
  echo "Install complete."
fi

echo "Backup location: $BACKUP_DIR"
echo "Wallpaper dir: $HOME_SHARE_DIR/wallpapers"
echo "Use: ~/.local/bin/set-wallpaper.sh $HOME_SHARE_DIR/wallpapers/uncannyblacc-dark.svg"
