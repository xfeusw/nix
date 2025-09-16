# home/xfeusw/development/tools.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Build tools
    gcc
    cmake
    gnumake
    pkg-config

    # Debuggers
    gdb
    valgrind

    # Version control
    git-lfs
    gh
    lazygit
    gitui

    # Container tools
    docker-compose
    podman-compose
    kubectl
    k9s
    helm

    # Database tools
    sqlite
    postgresql_16

    # API tools
    httpie
    curl
    wget

    # Documentation
    mdbook

    # Performance tools
    hyperfine # Benchmarking
    flamegraph # Profiling

    # Network tools
    nmap
    wireshark
    tcpdump

    # Text processing
    jq # JSON processor
    yq # YAML processor

    # File tools
    file
    tree
    unzip
    p7zip
    findutils
  ];
}
