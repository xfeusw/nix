# NixOS Configuration

A declarative NixOS configuration using flakes for an Acer laptop with KDE Plasma 6 desktop environment.

## 🖥️ System Overview

- **Host**: `acer` (NixOS system configuration)
- **User**: `xfeusw` (Home Manager configuration)
- **Desktop**: KDE Plasma 6 with Wayland support
- **Shell**: Zsh with Oh My Zsh
- **Editor**: Nixvim (custom Neovim configuration)

## 📁 Directory Structure

```
├── flake.nix                 # Main flake configuration
├── hosts/
│   └── acer/
│       ├── configuration.nix # Host-specific system config
│       └── hardware-configuration.nix
├── modules/                  # System modules
│   ├── desktop/
│   │   ├── plasma.nix       # KDE Plasma 6 configuration
│   │   └── gnome.nix        # Alternative GNOME setup
│   ├── networking.nix       # Network & Bluetooth
│   ├── nix-settings.nix     # Nix configuration & optimizations
│   ├── system-packages.nix  # System-wide packages
│   ├── users.nix           # User account configuration
│   ├── services.nix        # System services (SSH, GPG, etc.)
│   └── docker.nix          # Container setup (Podman)
├── home/xfeusw/            # Home Manager configuration
│   ├── home.nix            # Main home config
│   ├── packages.nix        # User packages
│   ├── packages/           # Organized package lists
│   │   ├── apps/          # Applications (browsers, chat, media)
│   │   ├── dev/           # Development tools & languages
│   │   ├── fonts/         # Font packages
│   │   └── system/        # System utilities
│   ├── git.nix            # Git configuration
│   ├── zsh.nix            # Zsh shell configuration
│   ├── plasma.nix         # KDE Plasma user settings
│   └── settings.nix       # Additional user settings
└── wallpaper/
    └── elizabeth.jpg       # Desktop wallpaper
```

## 🚀 Quick Start

### Initial Installation

1. Clone this repository to `/home/xfeusw/.config/nix/`:
```bash
git clone <your-repo> ~/.config/nix
cd ~/.config/nix
```

2. Build and switch to the system configuration:
```bash
sudo nixos-rebuild switch --flake .#acer
```

3. Install Home Manager configuration:
```bash
home-manager switch --flake .#xfeusw
```

### Daily Usage

The configuration includes convenient aliases in `zsh.nix`:

```bash
# System operations
sys-build     # Build system config (test before applying)
sys-update    # Apply system configuration changes

# Home Manager operations
home-build    # Build home config (test before applying)
home-update   # Apply home configuration changes

# Flake operations
check         # Validate flake configuration
```

## 🔧 Key Features

### System Configuration
- **Desktop Environment**: KDE Plasma 6 with Wayland support
- **Boot**: systemd-boot with EFI support
- **Security**: SSH with key-based authentication only
- **Containers**: Podman with Docker compatibility
- **Automatic Updates**: Daily system updates at 3:00 AM
- **Memory**: ZRAM swap (50% of RAM)
- **Garbage Collection**: Weekly cleanup of old generations

### Development Environment
- **Languages**: Rust, Node.js, Haskell, Java/Scala, Nix
- **Tools**: GCC, CMake, GDB, various development utilities
- **Editor**: Custom Nixvim configuration from external flake
- **Version Control**: Git with sensible defaults

### Applications
- **Browsers**: Brave, Firefox Developer Edition, Chrome, Tor
- **Communication**: Telegram, Discord
- **Media**: Spotify
- **Editors**: VS Code, Zed Editor
- **System Tools**: btop, lsof, strace, and more

### Fonts
- **Programming**: Fira Code, JetBrains Mono (regular + Nerd Fonts)
- **System**: Font configuration enabled for proper rendering

## 🎨 Desktop Customization

### KDE Plasma Configuration
- **Theme**: Breeze Dark
- **Panel**: Top panel (32px height) with essential widgets
- **Shortcuts**:
  - `Alt+Space` / `Alt+F2`: KRunner
  - `Meta+1-4`: Switch to desktops 1-4
- **Wallpaper**: Custom wallpaper at `wallpaper/elizabeth.jpg`

### Shell Configuration
- **Zsh**: With Oh My Zsh, autosuggestions, and syntax highlighting
- **Theme**: robbyrussell
- **Plugins**: git, docker

## 📦 Package Management

Packages are organized into logical categories in `home/xfeusw/packages/`:

- **Apps**: Browsers, chat clients, media players, editors
- **Dev**: Programming languages, development tools, compilers
- **Fonts**: Regular fonts and Nerd Fonts variants
- **System**: Core utilities, CLI tools, monitoring applications

All packages use the unstable channel for latest versions while maintaining system stability.

## 🔒 Security Features

- **SSH**: Disabled root login and password authentication
- **Firewall**: Enabled with SSH port (22) allowed
- **User**: Standard user with sudo privileges via wheel group
- **GPG**: Agent with SSH support enabled

## 🔄 Update Strategy

- **Automatic Updates**: System updates daily at 3:00 AM with randomized 45-minute delay
- **Garbage Collection**: Weekly cleanup keeping only 7 days of history
- **Input Updates**: Automatic updates for nixpkgs and nixpkgs-unstable
- **Lock File**: Automatically committed during updates

## 🛠️ Maintenance

### Adding New Packages

1. **System packages**: Add to `modules/system-packages.nix`
2. **User packages**: Add to appropriate file in `home/xfeusw/packages/`
3. **Development tools**: Use the organized structure in `packages/dev/`

### Modifying Configuration

1. Make changes to relevant `.nix` files
2. Test with build commands (`sys-build` or `home-build`)
3. Apply changes (`sys-update` or `home-update`)

### Troubleshooting

- **Check flake syntax**: `nix flake check`
- **View system generations**: `sudo nixos-rebuild list-generations`
- **Rollback system**: `sudo nixos-rebuild switch --rollback`
- **View home generations**: `home-manager generations`

## 📝 Hardware Information

This configuration is optimized for an Acer laptop with:
- Intel CPU with KVM support
- Standard laptop hardware (webcam, SD card reader, etc.)
- Separate `/home` partition
- EFI boot setup

Hardware configuration is automatically generated and stored in `hosts/acer/hardware-configuration.nix`.

## 🤝 Contributing

Feel free to submit issues and pull requests. When contributing:

1. Test changes with build commands before submitting
2. Follow the existing directory structure
3. Document significant changes in commit messages
4. Update this README for major configuration changes

## 📄 License

This configuration is provided as-is for educational and personal use.

---

**Note**: This is a personal NixOS configuration. Adapt the hardware configuration and personal settings (username, email, etc.) for your own use.
