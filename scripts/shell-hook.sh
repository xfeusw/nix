#!/usr/bin/env bash

echo "🚀 NixOS Configuration Development Shell"
echo ""
echo "Available commands:"
echo "  build-acer     - Build acer configuration"
echo "  build-xeon     - Build xeon configuration"
echo "  build-home     - Build home-manager configuration"
echo "  test-acer      - Test acer configuration"
echo "  test-xeon      - Test xeon configuration"
echo "  switch-acer    - Switch to acer configuration"
echo "  switch-xeon    - Switch to xeon configuration"
echo "  switch-home    - Switch to home-manager configuration"
echo "  fmt            - Format all files with treefmt"
echo "  fmt-check      - Check formatting without modifying"
echo "  lint           - Lint Nix files with statix"
echo "  clean          - Remove dead code with deadnix"
echo "  update         - Update flake inputs"
echo "  check          - Check flake outputs"
echo "  show-diff      - Show differences between generations"
echo ""

# Helper functions for NixOS configurations
build-acer() {
  nixos-rebuild build --flake .#acer "$@"
}

build-xeon() {
  nixos-rebuild build --flake .#xeon "$@"
}

build-home() {
  home-manager build --flake .#xfeusw "$@"
}

test-acer() {
  nixos-rebuild test --flake .#acer "$@"
}

test-xeon() {
  nixos-rebuild test --flake .#xeon "$@"
}

switch-acer() {
  sudo nixos-rebuild switch --flake .#acer "$@"
}

switch-xeon() {
  sudo nixos-rebuild switch --flake .#xeon "$@"
}

switch-home() {
  home-manager switch --flake .#xfeusw "$@"
}

# Formatting and linting functions
fmt() {
  echo "Formatting all files with treefmt..."
  treefmt "$@"
}

fmt-check() {
  echo "Checking formatting with treefmt..."
  treefmt --fail-on-change "$@"
}

lint() {
  echo "Linting with statix..."
  statix check . "$@"
}

clean() {
  echo "Checking for dead code..."
  deadnix . "$@"
}

# Flake management functions
update() {
  echo "Updating flake inputs..."
  nix flake update "$@"
}

check() {
  echo "Checking flake outputs..."
  nix flake check "$@"
}

show-diff() {
  echo "Showing differences between current and new generation..."
  nvd diff /run/current-system result "$@"
}

# Export all functions
export -f build-acer build-xeon build-home
export -f test-acer test-xeon
export -f switch-acer switch-xeon switch-home
export -f fmt fmt-check lint clean update check show-diff
