# UncannyBlacc Hyprland Rice

A lightweight, mood-rich Hyprland dotfiles setup built around the UncannyBlacc brand system: dark editorial palette, warm gold accents, old-root ritual energy, and a calm GNOME/Wayland-friendly workflow for a 13.5" Surface Pro 4 and 8GB RAM.

## Included
- Hyprland config tuned for a compact, comfortable setup
- Alacritty as the primary terminal
- Waybar top bar in dark editorial style
- Swaylock lock screen theme
- SDDM greeter theme snippets
- Generated wallpaper variants for review
- Icon mark and install script

## Brand palette
- Ink: #171412
- Bone: #F2EBDD
- Terracotta: #B85C3A
- Ochre: #C99A3E
- Moss: #53624A
- Plum: #5B394F

## Files
- `.config/hyprland/hyprland.conf`
- `.config/alacritty/alacritty.yml`
- `.config/waybar/config`
- `.config/waybar/style.css`
- `.config/swaylock/config`
- `.config/starship.toml`
- `.config/sddm/uncannyblacc.conf`
- `assets/wallpapers/uncannyblacc-dark.svg`
- `assets/wallpapers/uncannyblacc-accent.svg`
- `assets/wallpapers/uncannyblacc-light.svg`
- `assets/icons/ub-mark.svg`
- `scripts/set-wallpaper.sh`
- `install.sh`

## Install

1. Clone the repo
2. Review the wallpapers in `assets/wallpapers/`
3. Run:

```bash
chmod +x install.sh
./install.sh
```

The installer will:
- back up your current config directories under `~/.config/backup-uncannyblacc-<timestamp>`
- copy the config files into `~/.config`
- install the wallpaper asset files under `~/.local/share/uncannyblacc`
- set shell defaults for Starship if present

## Manual wallpaper set

```bash
~/.config/hyprland/scripts/set-wallpaper.sh ~/Pictures/uncannyblacc-dark.png
```

Or use the repo's generated SVG in `assets/wallpapers/`.

## Notes
- This setup is tuned to be light on a 13.5-inch laptop with 8GB RAM.
- It is optimized for Wayland and Debian / Sybiote OS style desktop workflows.
- If you want a more aggressive aesthetic later, the palette and icon system are already in place to expand without changing the core structure.

## Future iteration
- move from Waybar to a custom Hyprland-native bar if desired
- add a full SDDM theme package for system greeter if your Sybiote installation uses a custom `sddm.conf.d` setup
- add a lighter/noir alternate wallpaper variation for writing sessions
