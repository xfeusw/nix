# NixOS Configuration for Acer Laptop

This repository contains a comprehensive [NixOS](https://nixos.org/) configuration tailored for an Acer laptop, utilizing the power of [Nix Flakes](https://nixos.wiki/wiki/Flakes) for reproducible and modular system setup. It includes both system-level (`nixosConfigurations`) and user-level (`homeConfigurations`) configurations managed through [Home Manager](https://github.com/nix-community/home-manager).

## Overview

This configuration is designed to provide a modern, performant, and developer-friendly environment with a focus on:
- **GNOME Desktop Environment** with Wayland support and customized extensions.
- **Development Tools** for multiple programming languages (Rust, Node.js, Haskell, Java/Scala, Nix).
- **System Optimizations** for SSD, power management, and Intel hardware.
- **Security Enhancements** including AppArmor, a hardened SSH setup, and a robust firewall.
- **Modular Structure** for easy maintenance and extensibility.

The configuration is organized into modular files for system settings, user environment, and specific hardware/services, ensuring clarity and reusability.

## Features

### System Configuration
- **NixOS 25.05** as the base, with access to unstable packages via an overlay.
- **GNOME Desktop** with Wayland, optimized with extensions like Dash-to-Panel, Blur-My-Shell, and Vitals.
- **Hardware Optimizations** for Intel CPU, SSD, and Bluetooth.
- **Power Management** using TLP and auto-cpufreq for efficient battery usage.
- **Networking** with NetworkManager, fast DNS (Cloudflare/Google), and mDNS via Avahi.
- **Virtualization** support for Podman (Docker-compatible) and KVM/QEMU.
- **Backup** with Restic for daily backups of critical directories.
- **Security** with AppArmor, a hardened SSH configuration, and firewall rate-limiting.

### User Configuration (Home Manager)
- **Shell**: Zsh with Oh-My-Zsh, Starship prompt, and modern CLI tools (eza, bat, ripgrep, zoxide, fzf).
- **Terminal**: Ghostty with custom configuration for appearance and Zsh integration.
- **Development Tools**:
  - Rust: cargo, rustc, rust-analyzer, rustfmt, clippy.
  - Node.js: nodejs_22, pnpm, yarn, TypeScript, ESLint, Prettier.
  - Haskell: GHC, Cabal, Stack, haskell-language-server.
  - Java/Scala: JDK21, Maven, Gradle, Scala 3, SBT, Metals.
  - Nix: nil, nixd, nixpkgs-fmt, alejandra, and other Nix-specific tools.
- **Applications**:
  - Browsers: Brave, Firefox Developer Edition, Google Chrome, Tor Browser.
  - Communication: Telegram, Discord, Zoom, AnyDesk.
  - Media: Spotify, VLC, MPV, GIMP, OBS Studio.
  - Productivity: PDFtk, CopyQ (clipboard manager), unrar, p7zip.
- **Git**: Configured with aliases, GPG signing (optional), and tools like lazygit and gitui.
- **Desktop Customization**: Adwaita-dark theme, JetBrains Mono font, and a custom wallpaper.

## Structure

The configuration is split into modular directories for clarity and maintainability:

```
├── flake.nix               # Main flake definition
├── home/xfeusw/           # Home Manager configuration for user 'xfeusw'
│   ├── applications/       # Application packages (browsers, media, etc.)
│   ├── desktop/            # Desktop environment settings (GNOME, GTK, dconf)
│   ├── development/        # Development tools and language-specific setups
│   ├── shell/              # Shell configuration (Zsh, Starship, Ghostty)
│   └── git.nix             # Git configuration
├── hosts/acer/            # System configuration for Acer laptop
│   ├── configuration.nix   # Main system configuration
│   └── hardware-configuration.nix  # Hardware-specific settings
├── modules/               # Reusable system modules
│   ├── desktop/            # Desktop environment configurations
│   ├── hardware/           # Hardware-specific settings
│   ├── packages/           # System-wide packages
│   ├── services/           # System services
│   ├── virtualization/     # Virtualization and container settings
│   ├── backup.nix         # Backup configuration
│   ├── networking.nix      # Network settings
│   ├── nix-settings.nix    # Nix-specific settings
│   ├── power.nix          # Power management
│   └── security.nix        # Security configurations
```

## Installation

1. **Clone the Repository**:
   ```bash
   git clone github:xfeusw/nix ~/.config/nix
   cd ~/.config/nix
   ```

2. **Build and Apply System Configuration**:
   ```bash
   sudo nixos-rebuild switch --flake .#acer
   ```

3. **Build and Apply Home Manager Configuration**:
   ```bash
   home-manager switch --flake .#xfeusw
   ```

4. **Update the System**:
   To update the system and inputs:
   ```bash
   sudo nixos-rebuild switch --flake .#acer --upgrade
   ```

5. **Garbage Collection and Optimization**:
   To clean up old generations and optimize the Nix store:
   ```bash
   nix-clean
   ```

## Usage

- **Zsh Aliases**: Use `ll` for detailed file listings, `gs` for git status, or `sys-update` for system updates.
- **Development**: Access language-specific tools (e.g., `cargo`, `node`, `ghc`) and language servers directly.
- **Desktop**: Customize GNOME via `gnome-tweaks` or manage extensions with `gnome-extension-manager`.
- **Backup**: Restic automatically backs up `/home/xfeusw/{Documents,.config,Pictures}` daily. Check `/backup/restic` for snapshots.
- **Virtualization**: Use `podman` for containers or `virt-manager` for KVM/QEMU virtual machines.

## Customization

- **Add New Packages**: Modify `home/xfeusw/applications/` or `modules/packages/` to include additional software.
- **Change Theme/Wallpaper**: Update `home/xfeusw/desktop/dconf/` for GNOME settings or `home/xfeusw/shell/ghostty.nix` for terminal appearance.
- **Extend Modules**: Add new modules in `modules/` for system-wide features or `home/xfeusw/` for user-specific configurations.

## Notes

- **Secrets**: The Restic password is stored in `/etc/nixos/secrets/restic-password`. Replace `change-this-password` with a secure password.
- **Unfree Software**: The configuration allows unfree packages (e.g., VSCode, Spotify). Modify `nixpkgs.config.allowUnfree` if needed.
- **Nix Flakes**: Ensure `experimental-features = nix-command flakes` is enabled in your Nix configuration.
- **Hardware**: The configuration is tailored for an Acer laptop with Intel CPU and SSD. Adjust `hosts/acer/hardware-configuration.nix` for other hardware.

## Contributing

Feel free to fork this repository and submit pull requests for improvements or additional features. Ensure changes are modular and follow the existing structure.

## License

This configuration is licensed under the [MIT License](LICENSE).
