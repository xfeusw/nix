{
  pkgs,
  inputs,
  ...
}: let
  bleur = inputs.bleur.packages.${pkgs.system}.default;
in {
  home.packages = with pkgs; [
    # Core utilities
    bat
    btop
    eza
    ffmpeg

    # Dev toolchain
    cmake
    gcc14
    gnumake
    pkg-config
    # bruno
    # bruno-cli

    # Debuggers
    gdb
    lldb

    # Version control
    git-lfs
    lazygit

    # Container orchestration
    docker-compose
    podman-compose
    k9s
    kubectl

    # Network clients
    curl
    httpie
    wget

    # Data transformation
    jq
    yq

    # System utilities
    p7zip
    tree
    unrar
    unzip
    sops

    # Nix ecosystem tools
    alejandra
    cachix
    just
    nil
    nixd

    # Browsers
    # brave
    google-chrome
    tor-browser

    # Communication clients
    discord
    # element-desktop
    telegram-desktop

    # Media stack
    mpv
    pdftk
    playerctl
    spotify
    vlc

    # Wayland tools
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

    # etc
    obs-studio
    hyperbeam
    treefmt
    qbittorrent
    shfmt
    # rustdesk
    fastfetch
    # floorp-bin
    # omnix
    postgresql
    libpq
    openssl
    libiconv
    libreoffice
    element-desktop
    postman
    yandex-music-bin
    package-version-server
    bleur
  ];
}
