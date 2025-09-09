# home/xfeusw/packages.nix
{ config, pkgs, lib, unstable ? null, ... }:
let
  unstablePkgs = if unstable != null then unstable else
    import <nixpkgs-unstable> {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in
{
  home.packages = (with unstablePkgs; [
    # System tools
    tree
    # Applications
    telegram-desktop
    zed-editor
    code-cursor
    windsurf
    vscode
    spotify
    discord
    tor-browser
    brave
    firefox-devedition
    google-chrome
    # Developer tools
    nodejs_22
    pnpm
    ruby
    rustup
    gcc
    cmake
    gnumake
    pkg-config
    gdb
    haskell.compiler.ghc96
    cabal-install
    stack
    jdk
    sbt
    scala
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    fira-code
    jetbrains-mono
  ]);
}
