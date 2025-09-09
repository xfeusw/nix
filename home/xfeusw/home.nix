# home/xfeusw/home.nix
{ config, pkgs, lib, unstable ? null, nixvim, ... }:
let
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
  nixpkgs.config.allowUnfree = true;

  # Import nixvim configuration
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
    cargo
    rust-analyzer
    rustfmt
    gcc
    clang
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

  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "khamrakulovkamron@gmail.com";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      color.ui = "auto";
      pull.rebase = true;
      push.default = "simple";
      merge.conflictStyle = "diff3";
      rerere.enabled = true;
    };
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" ];
      theme = "robbyrussell";
    };
  };
}
