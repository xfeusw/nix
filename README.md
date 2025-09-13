# 🚀 NixOS Configuration

A comprehensive, modular NixOS configuration with Home Manager integration, optimized for development workflows and daily productivity.

## 📋 Overview

This configuration provides a complete desktop environment setup with:
- **OS**: NixOS 25.05 with Nix Flakes
- **Desktop**: KDE Plasma 6 with Wayland support
- **Home Management**: Home Manager for user-space configuration
- **Development**: Multi-language development environment
- **Architecture**: Modular and maintainable configuration structure

## 🏗️ Structure

```
.
├── flake.nix                    # Main flake configuration
├── flake.lock                   # Flake input lockfile
├── hosts/
│   └── acer/
│       ├── configuration.nix    # Host-specific configuration
│       └── hardware-configuration.nix
├── modules/                     # System modules
│   ├── backup.nix              # Restic backup configuration
│   ├── nix-settings.nix        # Nix daemon settings & optimization
│   ├── networking.nix          # Network & DNS configuration
│   ├── power.nix               # TLP & power management
│   ├── security.nix            # Security hardening & SSH
│   ├── users.nix               # User account management
│   ├── desktop/
│   │   ├── plasma.nix          # KDE Plasma 6 configuration
│   │   └── gnome.nix           # Alternative GNOME setup
│   ├── hardware/
│   │   ├── default.nix         # Hardware module imports
│   │   ├── graphics.nix        # Intel graphics & VA-API
│   │   ├── cpu.nix             # Intel CPU optimizations
│   │   ├── bluetooth.nix       # Bluetooth configuration
│   │   ├── firmware.nix        # Firmware updates
│   │   └── ssd-optimization.nix # SSD performance tweaks
│   ├── packages/
│   │   ├── default.nix         # Package module imports
│   │   ├── system-essentials.nix # Core system packages
│   │   ├── development-cli.nix  # Development tools
│   │   ├── kde-plasma.nix      # KDE applications
│   │   ├── media.nix           # Media & graphics apps
│   │   └── fonts.nix           # Font configuration
│   ├── services/
│   │   ├── default.nix         # Service module imports
│   │   ├── printing.nix        # Printing & scanning
│   │   ├── location.nix        # GPS & location services
│   │   ├── database.nix        # Database services
│   │   └── system-programs.nix # System-wide programs
│   └── virtualization/
│       ├── default.nix         # Virtualization imports
│       ├── containers.nix      # Podman configuration
│       └── kvm.nix            # KVM/QEMU setup
├── home/
│   └── xfeusw/
│       ├── home.nix            # Main home configuration
│       ├── git.nix             # Git configuration
│       ├── applications/
│       │   ├── default.nix     # Application imports
│       │   ├── browsers.nix    # Web browsers
│       │   ├── communication.nix # Chat & video apps
│       │   ├── media.nix       # Media applications
│       │   └── productivity.nix # Productivity tools
│       ├── desktop/
│       │   ├── default.nix     # Desktop imports
│       │   └── plasma.nix      # Plasma user configuration
│       ├── development/
│       │   ├── default.nix     # Development imports
│       │   ├── tools.nix       # Development tools
│       │   └── languages/
│       │       ├── default.nix # Language imports
│       │       ├── rust.nix    # Rust toolchain
│       │       ├── nodejs.nix  # Node.js & npm tools
│       │       ├── nix.nix     # Nix language tools
│       │       ├── haskell.nix # Haskell & GHC
│       │       └── java-scala.nix # JVM languages
│       └── shell/
│           ├── default.nix     # Shell imports
│           ├── zsh.nix         # Zsh configuration
│           └── starship.nix    # Starship prompt
└── wallpaper/
    └── elizabeth.jpg           # Desktop wallpaper
```

## 🖥️ Hardware Support

- **CPU**: Intel processors with microcode updates
- **Graphics**: Intel integrated graphics with VA-API acceleration
- **Storage**: SSD-optimized with TRIM support
- **Power**: Laptop power management with TLP and auto-cpufreq
- **Connectivity**: WiFi, Bluetooth, and networking

## 🛠️ Development Environment

### Languages & Runtimes
- **Rust**: Complete toolchain with cargo, rustc, rust-analyzer
- **Node.js**: Latest LTS with pnpm, yarn, and TypeScript
- **Nix**: Language servers (nil, nixd) and formatters
- **Haskell**: GHC, Stack, Cabal, and language server
- **Java/Scala**: OpenJDK 21, Maven, Gradle, SBT, Metals

### Development Tools
- **Editors**: Neovim (nixvim), VS Code, Zed Editor
- **Version Control**: Git with GitHub CLI, LazyGit, GitUI
- **Containers**: Podman with Docker compatibility
- **Virtualization**: KVM/QEMU with virt-manager
- **Databases**: PostgreSQL, SQLite
- **API Testing**: HTTPie, curl
- **Monitoring**: htop, btop, k9s

### Modern CLI Tools
- **File Operations**: eza (ls), bat (cat), fd (find), ripgrep (grep)
- **Navigation**: zoxide (smart cd), fzf (fuzzy finder)
- **System Monitoring**: bottom/btop (top), dust (du), procs (ps)
- **Network**: bandwhich, dogdns

## 🎨 Desktop Environment

### KDE Plasma 6 Features
- **Display Protocol**: Wayland with X11 fallback
- **Theme**: Breeze Dark with custom wallpaper
- **Applications**: Full KDE suite (Dolphin, Kate, Konsole, etc.)
- **Keyboard**: US/Russian layouts with smart switching
- **Audio**: PipeWire with ALSA and JACK support

### Applications
- **Browsers**: Firefox, Brave, Chrome, Tor Browser
- **Communication**: Telegram, Discord, Zoom
- **Media**: VLC, MPV, Spotify, OBS Studio
- **Graphics**: GIMP, Inkscape
- **Productivity**: PDF tools, archive managers, clipboard manager

## 🚀 Quick Start

### Prerequisites
- NixOS 25.05 or later
- Git for cloning the repository
- Administrative access (sudo)

### Installation

1. **Clone the repository**:
   ```bash
   git clone <your-repo-url> ~/.config/nix
   cd ~/.config/nix
   ```

2. **Update hardware configuration**:
   ```bash
   # Generate new hardware config for your system
   sudo nixos-generate-config --show-hardware-config > hosts/acer/hardware-configuration.nix
   ```

3. **Customize configuration**:
   - Edit `hosts/acer/configuration.nix` for system settings
   - Modify `home/xfeusw/home.nix` for user preferences
   - Update timezone, locale, and hostname as needed

4. **Build and switch**:
   ```bash
   # Build system configuration (test first)
   sudo nixos-rebuild build --flake .#acer

   # Apply system configuration
   sudo nixos-rebuild switch --flake .#acer

   # Apply home configuration
   home-manager switch --flake .#xfeusw
   ```

## 📝 Usage

### System Management

```bash
# System operations
sys-build        # Build system configuration
sys-update       # Apply system updates
home-build       # Build home configuration
home-update      # Apply home configuration
check           # Check flake validity

# Navigation shortcuts
config          # Go to ~/.config
nix-config      # Go to ~/.config/nix

# Modern CLI usage
ls              # eza with icons
cat file.txt    # bat with syntax highlighting
find . -name    # fd (faster find)
grep pattern    # ripgrep (faster grep)
cd project      # zoxide (smart cd with frecency)
```

### Development Workflow

```bash
# Git shortcuts
gs              # git status
ga file.txt     # git add
gc "message"    # git commit
gp              # git push
gl              # git pull

# System information
sysinfo         # Quick system overview
top             # btop system monitor
```

## 🔧 Customization

### Adding New Packages

**System packages** (available to all users):
```nix
# Add to modules/packages/system-essentials.nix
environment.systemPackages = with pkgs; [
  your-package-here
];
```

**User packages** (home-manager):
```nix
# Add to home/xfeusw/applications/
home.packages = with pkgs; [
  your-package-here
];
```

### Adding New Services

Create a new module in `modules/services/` or add to existing ones:
```nix
# modules/services/your-service.nix
{ ... }:
{
  services.your-service = {
    enable = true;
    # configuration options
  };
}
```

### Hardware-Specific Changes

Modify files in `modules/hardware/` for hardware-specific optimizations.

## 🔒 Security Features

- **AppArmor**: Mandatory access control
- **Firewall**: Configured with SSH rate limiting
- **SSH**: Hardened configuration with key-only authentication
- **Automatic updates**: Daily system updates and garbage collection
- **User isolation**: Proper user/group management

## 💾 Backup Strategy

- **Restic**: Automated daily backups
- **Retention**: 7 daily, 4 weekly, 12 monthly, 3 yearly
- **Scope**: Documents, configs, pictures
- **Exclusions**: Cache, temporary files, trash

## 🎯 Performance Optimizations

- **SSD**: TRIM, noatime mounting, appropriate I/O schedulers
- **Memory**: ZRAM compression (50% of RAM)
- **CPU**: Auto frequency scaling, thermal management
- **Network**: Optimized buffer sizes, DNS caching
- **Boot**: Fast boot with minimal timeout

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes following the modular structure
4. Test with `nixos-rebuild build --flake .#acer`
5. Commit and push: `git commit -m "Description" && git push`
6. Submit a pull request

## 📚 Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
- [NixOS Hardware](https://github.com/NixOS/nixos-hardware)
- [nix.dev](https://nix.dev)

## 📄 License

This configuration is provided as-is for educational and personal use. Feel free to adapt it for your own systems.

---

**⚠️ Note**: This configuration is tailored for the specific hardware and preferences described above. You may need to adjust hardware-configuration.nix and other settings for your system.
