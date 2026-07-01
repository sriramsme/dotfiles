# dotfiles

Personal dotfiles for Arch Linux + Hyprland, managed with GNU Stow.

## Setup

```bash
cd ~/projects/dotfiles
stow -d ~/projects/dotfiles -t ~ bash profile ghostty nvim tmux starship hypr hyprlock hyprpaper mako waybar bin agents mimeapps
```

## Packages

| Package | Contents |
|---------|----------|
| `bash` | `.bashrc`, `.bash_profile` |
| `profile` | `.profile` — env vars, PATH, Wayland |
| `ghostty` | Terminal config |
| `nvim` | Neovim config (ThePrimeagen-based) |
| `tmux` | tmux config + TPM plugins |
| `starship` | Prompt config |
| `hypr` | Hyprland config |
| `hyprlock` | Lock screen config |
| `hyprpaper` | Wallpaper config |
| `mako` | Notifications config |
| `waybar` | Status bar config |
| `bin` | Scripts: `tmux-sessionizer`, `wallpaper-rotate`, `powermenu`, `agents-init`, `agents-setup` |
| `agents` | Central `AGENTS.md` for Claude Code, Codex, Opencode |
| `mimeapps` | Default file associations |

## Scripts

- `tmux-sessionizer` — fuzzy find and switch tmux sessions (`Ctrl+f` in nvim/tmux)
- `wallpaper-rotate` — randomly rotates wallpapers from `~/Pictures/Wallpapers/` hourly
- `agents-init` — creates `AGENTS.md` + `CLAUDE.md` symlink in a project
- `agents-setup` — symlinks central `AGENTS.md` to all agent harnesses (run after installing Claude Code, Codex, Opencode)

## Agent harnesses

After installing Claude Code, Codex and Opencode:

```bash
agents-setup
```

## Key bindings (Hyprland)

| Key | Action |
|-----|--------|
| `Super+Q` | Open terminal |
| `Super+E` | Open Dolphin |
| `Super+R` | App launcher |
| `Super+C` | Close window |
| `Super+L` | Lock screen |
| `Super+B` | Bluetooth manager |
| `Super+F` | Toggle fullscreen |
| `Super+M` | Shutdown |
| `Super+Shift+M` | Reboot |
| `Print` | Screenshot fullscreen |
| `Super+Print` | Screenshot window |
| `Super+Shift+Print` | Screenshot region |
| `Super+Shift+V` | Clipboard history |
| `Super+1..10` | Switch workspace |
| `Super+Shift+1..10` | Move window to workspace |

## Notes

- Wallpapers go in `~/Pictures/Wallpapers/`
- Screenshots save to `~/Pictures/Screenshots/`
- Font: JetBrainsMono Nerd Font
- SDDM theme: sddm-astronaut (jake the dog) — installed separately, not in dotfiles
