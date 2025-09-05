# home/xfeusw/home.nix
{ config, pkgs, lib, unstable ? null, nixvim, ... }:
let
  # If unstable is not passed, create it
  unstablePkgs = if unstable != null then unstable else
    import <nixpkgs-unstable> {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  # Fix version mismatch warning
  home.enableNixpkgsReleaseCheck = false;
  # Allow unfree packages in home-manager
  nixpkgs.config.allowUnfree = true;

  # Import your nixvim configuration
  imports = [
    ./nixvim
  ];

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
    # yandex-music  # Should work better in unstable
    discord
    tor-browser
    brave
    firefox-devedition
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    fira-code
    jetbrains-mono
  ]);

  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "you@example.com";
    extraConfig = {
      core.editor = "nvim"; # Changed from nano to nvim
      init.defaultBranch = "main";
      color.ui = "auto";
      pull.rebase = true;
      push.default = "simple";
      merge.conflictStyle = "diff3";
      rerere.enabled = true;
    };
  };
}
