{ pkgs, ... }:
let
  coreUtils = with pkgs.unstable; [
    bat
    btop
    eza
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
    sops
  ];
  nixEcosystem = with pkgs.unstable; [
    alejandra
    cachix
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
  waylandTools = with pkgs.unstable; [
    wayland
    wayland-protocols
    wayland-utils
    grim
    slurp
    wf-recorder
    swappy
    wlr-randr
    wdisplays
    cliphist
    wl-clipboard-rs
    swaylock
    swayidle
    swaybg
    hyprpicker
    brightnessctl
    pamixer
    xwayland
    libnotify
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
    ++ waylandTools;
}
