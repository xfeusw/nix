# NixOS Flake for acer

This repository contains a modular NixOS configuration managed with flakes and Home Manager.

## Layout
- `flake.nix`: flake inputs/outputs, NixOS config, dev shell
- `hosts/acer/`
  - `configuration.nix`: host entry point (imports modules)
  - `hardware-configuration.nix`: machine-specific hardware config
- `modules/`
  - `nix.nix`: Nix settings, overlays, base packages, auto-upgrades/GC
  - `networking.nix`: hostname, NetworkManager, firewall
  - `desktop/plasma.nix`: KDE Plasma 6 (SDDM), keyboard layouts, audio, input, Firefox
  - `services.nix`: OpenSSH, gpg-agent, mtr
  - `users.nix`: user accounts and groups
  - `docker.nix`: Docker daemon and group
  - `home-manager.nix`: enables Home Manager and imports user home config
- `home/xfeusw/home.nix`: Home Manager config (user packages), `home.stateVersion = "25.05"`

## Prerequisites
- Nix with flakes enabled (temporary flags also work):
  - Add to config (recommended):
    - `nix.settings.experimental-features = [ "nix-command" "flakes" ];`
  - Or pass flags to commands: `nix --extra-experimental-features 'nix-command flakes' ...`

## First-time build and activation
1. Validate outputs
```bash
nix --extra-experimental-features 'nix-command flakes' flake show /home/xfeusw/.config/nix
```
2. Build without changing the system
```bash
nix --extra-experimental-features 'nix-command flakes' build /home/xfeusw/.config/nix#nixosConfigurations.acer.config.system.build.toplevel
```
3. Dry-activate (show what would change)
```bash
sudo nixos-rebuild dry-activate --flake /home/xfeusw/.config/nix#acer
```
4. Test (apply until reboot) or Switch (persistent)
```bash
sudo nixos-rebuild test   --flake /home/xfeusw/.config/nix#acer
sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix#acer
```

## Daily usage
- Update inputs and build
```bash
nix flake update /home/xfeusw/.config/nix
nix --extra-experimental-features 'nix-command flakes' build /home/xfeusw/.config/nix#nixosConfigurations.acer.config.system.build.toplevel
sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix#acer
```
- Enter dev shell (Node.js+pnpm, Rust, C/C++, Haskell, Scala, Docker tools)
```bash
nix develop /home/xfeusw/.config/nix
```

## Home Manager
- Managed via `modules/home-manager.nix` and `home/xfeusw/home.nix`.
- Add/remove user packages by editing `home/xfeusw/home.nix` and switching again.

## Docker
- Docker is enabled; user `xfeusw` is in the `docker` group.
- After the first switch, log out/in (or reboot) for group membership to take effect.

## Keyboard & Desktop
- KDE Plasma 6 (SDDM). XKB layouts: `us,ru` with toggles `Alt+Shift` and `Win+Space`.
- Firefox is enabled at the system level and appears in the application launcher.

## Reliability
- Auto-upgrades daily at 03:00 with randomized delay, updating `nixpkgs` and `nixpkgs-unstable`, and committing `flake.lock`.
- Auto GC weekly with `--delete-older-than 14d`.

## Security notes
- Change the temporary password: `sudo passwd xfeusw`.
- Firewall is currently disabled. Consider enabling it and opening only required ports.

## Troubleshooting
- Build complains about missing files but `path:` works:
  - Commit new files; building through the Git tree ignores untracked files.
- Home Manager error `home.stateVersion` missing:
  - Ensure `home.stateVersion = "25.05";` is set in `home/xfeusw/home.nix`.
- Can’t find apps in launcher:
  - Make sure the program is enabled (e.g., `programs.firefox.enable = true;`) and re-login.

## Contributing / housekeeping
- Ignore build symlinks `result*` (see `.gitignore`).
- Prefer small, modular changes under `modules/` and import from the host file. 