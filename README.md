# NixOS Configuration

Personal NixOS configuration using flakes for declarative system and home management.

## Structure

```
.
├── flake.nix              # Main flake configuration
├── hosts/
│   └── acer/              # System configuration for acer laptop
└── home/
    └── xfeusw/            # User configuration
        ├── applications/  # GUI applications
        ├── desktop/       # KDE Plasma setup
        ├── development/   # Dev tools and languages
        └── shell/         # Zsh, Starship, Ghostty
```

## Features

- **Desktop**: KDE Plasma 6 on Wayland with Breeze Dark theme
- **Shell**: Zsh with modern CLI tools (eza, bat, ripgrep, zoxide)
- **Editor**: Neovim via nixvim-config
- **Terminal**: Ghostty with transparency
- **Applications**: Firefox, VSCode, Telegram, Discord, Spotify

## Quick Commands

### System Management
```bash
sys-build    # Build system configuration
sys-switch   # Apply system changes
sys-update   # Update and switch
```

### Home Management
```bash
home-build   # Build home configuration
home-switch  # Apply home changes
home-update  # Update home environment
```

### Maintenance
```bash
nix-clean    # Clean old generations and optimize store
nix-search   # Search for packages
```

## Installation

1. Clone the repository:
```bash
git clone github:xfeusw/nix ~/.config/nix
cd ~/.config/nix
```

2. Build and apply system configuration:
```bash
sudo nixos-rebuild switch --flake .#acer
```

3. Build and apply home configuration:
```bash
home-manager switch --flake .#xfeusw
```

## Key Configurations

### Plasma Desktop
- Theme: Breeze Dark
- Cursor: Bibata Modern Ice
- 4 virtual desktops
- Focus follows mouse
- Minimal effects for performance

### Shell Environment
- **Modern replacements**: `ls` → `eza`, `cat` → `bat`, `grep` → `rg`
- **Git shortcuts**: `gs`, `ga`, `gc`, `gp`, `gl`
- **FZF**: Fuzzy finding with preview
- **Direnv**: Automatic environment loading

### Development Tools
- Nix: nil, nixd, alejandra
- Build: gcc, cmake, make
- Debug: gdb, lldb
- Containers: Docker (via Podman), kubectl, k9s
- Version control: git, gh, lazygit

## Customization

Edit files in `home/xfeusw/` to customize:
- `desktop/plasma/` - KDE settings and appearance
- `shell/zsh.nix` - Shell aliases and functions
- `applications/` - Installed GUI applications
- `development/` - Development tools and languages

After changes, run `home-switch` to apply.

## Notes

- Configuration uses NixOS 25.05 (stable) with some unstable packages
- Home Manager manages user-level configuration
- Plasma Manager handles KDE settings declaratively
- All changes are version-controlled and reproducible
