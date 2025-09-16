NixOS Configuration :)
This repository contains a comprehensive NixOS flake configuration, designed for a modern, performant, and customizable development environment. It leverages NixOS 25.05 with unstable channel support, Home Manager for user configuration, and modular system settings for easy maintenance and reproducibility.
Features

System Configuration:

Based on NixOS 25.05 with nixpkgs-unstable for cutting-edge packages
Optimized for Intel CPU, SSD, and graphics with hardware-specific tweaks
Uses systemd-boot with EFI support and kernel optimizations for performance
Timezone set to Asia/Samarkand with en_US.UTF-8 locale


Desktop Environment:

GNOME with Wayland for a modern, smooth experience
Customized with extensions: Dash-to-Panel, Vitals, Blur-my-Shell, GSConnect, Caffeine, ArcMenu, and more
Adwaita-dark theme with custom wallpaper (elizabeth.jpg)
Wayland-optimized environment variables for Firefox, GTK, and Qt apps


User Environment:

Managed by Home Manager for user xfeusw
ZSH shell with Oh My Zsh, Starship prompt, and modern CLI tools (bat, eza, fd, ripgrep, zoxide, fzf)
Git configuration with aliases, GitHub CLI, and TUIs (lazygit, gitui)


Development Tools:

Comprehensive support for Rust, Node.js, Haskell, Java/Scala, and Nix
Includes language servers, formatters, linters, and build tools
Container tools: Podman, Docker Compose, Kubernetes (kubectl, k9s, helm)
Database tools: SQLite, PostgreSQL
Additional CLI utilities: jq, yq, httpie, mdbook, hyperfine, flamegraph


System Services:

Restic for daily backups of /home/xfeusw/Documents, /home/xfeusw/.config, and /home/xfeusw/Pictures
TLP and auto-cpufreq for power management
Hardened SSH with no root login, no password auth, and rate limiting
AppArmor and firewall with SSH rate limiting
Podman for containerization and KVM/QEMU for virtualization
Flatpak support for additional application flexibility


Performance & Optimization:

SSD optimizations (noatime, nodiratime, fstrim)
ZRAM for memory compression (50% of RAM)
Aggressive Nix garbage collection and store optimization
Automatic system upgrades with flake updates



Directory Structure

flake.nix: Defines inputs (nixpkgs, home-manager, nixos-hardware, NUR, nixvim-config) and outputs for system (acer) and user (xfeusw) configurations
hosts/acer/:
configuration.nix: System settings, boot options, and module imports
hardware-configuration.nix: Hardware-specific settings (filesystems, kernel modules)


modules/:
nix-settings.nix: Nix configuration with flakes, substituters, and auto-upgrade
networking.nix: NetworkManager, fast DNS, and Avahi for mDNS
security.nix: AppArmor, hardened SSH, and firewall
power.nix: TLP, auto-cpufreq, and thermald for power efficiency
users.nix: User xfeusw with ZSH and group permissions
desktop/: GNOME and Plasma configurations
hardware/: CPU, graphics, Bluetooth, and SSD optimizations
packages/: System-wide packages (CLI tools, GNOME apps, fonts)
services/: Optional database, printing, and location services
virtualization/: Podman and KVM/QEMU configurations


home/xfeusw/:
home.nix: Home Manager entry point
applications/: Browsers (Brave, Firefox, Chrome, Tor), communication (Telegram, Discord, Zoom), media (Spotify, VLC, GIMP), and productivity tools
desktop/: GNOME settings (GTK, dconf, extensions, wallpaper)
development/: Language-specific tools (Rust, Node.js, Haskell, Java/Scala, Nix) and general dev tools
shell/: ZSH with aliases, Starship prompt, and modern CLI replacements
git.nix: Git configuration with aliases and tools



Setup Instructions

Clone the Repository:
git clone github:xfeusw/nix ~/.config/nix
cd ~/.config/nix


Apply System Configuration:
sudo nixos-rebuild switch --flake .#acer


Apply Home Manager Configuration:
home-manager switch --flake .#xfeusw


Update System and Inputs:
sudo nixos-rebuild switch --flake .#acer --upgrade
nix flake update


Clean Up Old Generations:
nix-clean



Customization

Wallpaper: Update wallpaperPath in home/xfeusw/desktop/dconf/background.nix
Restic Backup: Set a secure password in /etc/nixos/secrets/restic-password
Services: Enable optional services (e.g., PostgreSQL, printing) in modules/services/
Extensions: Modify GNOME extension settings in home/xfeusw/desktop/dconf/extensions/
Packages: Add or remove packages in home/xfeusw/applications/ or modules/packages/
ZSH Aliases: Customize aliases in home/xfeusw/shell/zsh.nix

Maintenance

Update Flake Inputs:
nix flake update


Check Flake:
nix flake check


Monitor Backups:
systemctl status restic-backups-localbackup


Garbage Collection:
nix-clean



Notes

Ensure the wallpaper file (elizabeth.jpg) exists at the specified path
Review commented-out modules (e.g., Python, printing) and enable as needed
SSH keys must be set up for passwordless authentication
Regularly check journalctl for service errors
Use home-manager news to track Home Manager changes

This configuration is designed for a balance of performance, usability, and development productivity. Adjust modules and settings to fit your specific needs.
