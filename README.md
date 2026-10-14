# UncannyBlacc Hyprland Rice

A lightweight Wayland desktop built around the UncannyBlacc editorial identity.

## Features
- Hyprland config tuned for a compact 13.5" / 8GB machine
- Alacritty as the primary terminal
- Waybar top bar with dark editorial styling
- Swaylock + wallpaper switching
- XFCE compatibility notes and greeter notes
- Brand palette derived from UncannyBlacc

## Brand palette
- Ink: #171412
- Bone: #F2EBDD
- Terracotta: #B85C3A
- Ochre: #C99A3E
- Moss: #53624A
- Plum: #5B394F

## Files included
- `.config/hyprland/hyprland.conf`
- `.config/alacritty/alacritty.yml`
- `.config/waybar/config`
- `.config/waybar/style.css`
- `.config/swaylock/config`
- `.config/starship.toml`
- `assets/wallpapers/` (default + user wallpaper)
- `assets/icons/ub-mark.svg`
- `scripts/set-wallpaper.sh`
- `install.sh`

## Current wallpaper choice
The default wallpaper is the floral dark composition supplied by the user. It is kept as the primary art direction for the desktop because it fits the UncannyBlacc brand and matches the dark editorial palette while staying gentle on performance.

## Install

```bash
chmod +x install.sh
./install.sh
```

The installer backs up existing config directories before copying the new ones.

## XFCE / display manager note
Because you are switching from GNOME and may use XFCE with Hyprland, the desktop is designed for a Wayland session; choose a display manager that supports the Hyprland session file (`/usr/share/wayland-sessions/hyprland.desktop`).

If you install LightDM, keep the session file and set the greeter background to a floral dark image to match the rice. If you prefer SDDM, it can also be used with a matching greeter theme.

## Notes
- This setup prioritizes comfort on 8GB RAM and a 13.5" laptop.
- Blur and animations are intentionally restrained for low resource use.
- Alacritty uses JetBrains Mono as the system fallback and matches the brand with the dark ink / gold / plum palette.
