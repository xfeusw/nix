{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Modern development tools
    gitoxide
    delta
    difftastic
    just
    direnv
    cachix
    nix-fast-build
    nix-update
    nurl

    # Enhanced CLI tools
    bat
    eza
    fd
    ripgrep
    zoxide
    fzf
    btop
    dust
    procs
    hyperfine
    tokei

    # Build tools
    gcc
    cmake
    gnumake
    pkg-config
    meson
    ninja

    # Debuggers and profilers
    gdb
    valgrind
    lldb
    perf-tools
    flamegraph

    # Version control
    git-lfs
    gh
    lazygit
    gitui
    git-absorb

    # Container tools
    docker-compose
    podman-compose
    kubectl
    k9s
    helm
    dive
    ctop

    # Database tools
    sqlite
    postgresql_16
    redis
    dbeaver-bin

    # API and network tools
    httpie
    curl
    wget
    postman
    insomnia

    # Documentation
    mdbook
    hugo

    # Text processing
    jq
    yq
    xmlstarlet

    # System tools
    file
    tree
    unzip
    findutils
    patchelf
    binutils

    # Security tools
    age
    sops

    # Monitoring
    htop
    iotop
    nethogs
    bandwhich
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
