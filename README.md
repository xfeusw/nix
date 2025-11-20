# NixOS Flake Config

Minimal flake-based NixOS setup with Home Manager.

## Structure

- Two hosts: **xeon** and **acer**.
- Home Manager user: **xfeusw**.
- Dev-shells included for development.

## Setup

1. Replace `hardware-configuration.nix` with the one generated on your machine.
1. Update the hostname in each host's configuration.
1. Update usernames inside both system configs and Home Manager modules.

## Rebuild

```sh
sudo nixos-rebuild switch --flake .#<hostname>
```

## Dev Shells

```sh
nix develop
```
