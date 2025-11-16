{ pkgs, ... }:

let
  coreUtils = with pkgs.unstable; [
    bat
    btop
    eza
    fd
    fzf
    ripgrep
    zoxide
  ];

  devToolchain = with pkgs.unstable; [
    cmake
    gcc
    gnumake
    pkg-config
  ];

  debuggers = with pkgs.unstable; [
    gdb
    lldb
  ];

  vcs = with pkgs.unstable; [
    git-lfs
    lazygit
  ];

  containerOrchestration = with pkgs.unstable; [
    docker-compose
    k9s
    kubectl
  ];

  networkClients = with pkgs.unstable; [
    curl
    httpie
    wget
  ];

  dataTransform = with pkgs.unstable; [
    jq
    yq
  ];

  sysUtils = with pkgs.unstable; [
    p7zip
    tree
    unrar
    unzip
  ];

  nixEcosystem = with pkgs.unstable; [
    alejandra
    cachix
    direnv
    just
    nil
    nixd
  ];

  browsers = with pkgs.unstable; [
    brave
    google-chrome
    tor-browser
  ];

  commsClients = with pkgs.unstable; [
    discord
    element-desktop
    telegram-desktop
  ];

  mediaStack = with pkgs.unstable; [
    mpv
    pdftk
    playerctl
    spotify
    spotify-cli-linux
    spotify-tray
    vlc
  ];

  editors = with pkgs.unstable; [
    vscode
    zed-editor
  ];

in {
  home.packages =
    coreUtils
    ++ devToolchain
    ++ debuggers
    ++ vcs
    ++ containerOrchestration
    ++ networkClients
    ++ dataTransform
    ++ sysUtils
    ++ nixEcosystem
    ++ browsers
    ++ commsClients
    ++ mediaStack
    ++ editors;
}
