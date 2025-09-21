# home/xfeusw/development/tools.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Modern development tools
    gitoxide          # Faster git clone
    delta             # Better git diff
    difftastic        # Syntax-aware diff
    just              # Command runner
    direnv            # Environment management
    cachix            # Binary cache management

    # Nix-specific tools
    nix-fast-build    # Faster nix builds
    nix-update        # Update nix packages
    nurl              # Generate nix URLs

    # Enhanced CLI tools
    bat               # Better cat
    eza               # Better ls
    fd                # Better find
    ripgrep           # Better grep
    zoxide            # Smart cd
    fzf               # Fuzzy finder
    btop              # Better top
    dust              # Better du
    procs             # Better ps
    hyperfine         # Benchmarking
    tokei             # Code statistics

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

    # Container and orchestration tools
    docker-compose
    podman-compose
    kubectl
    k9s
    helm
    dive              # Docker image analyzer
    ctop              # Container top

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
    jq                # JSON processor
    yq                # YAML processor
    xmlstarlet        # XML processor

    # System tools
    file
    tree
    unzip
    p7zip
    findutils
    patchelf
    binutils

    # Security tools
    age               # Encryption
    sops              # Secrets management

    # Monitoring
    htop
    iotop
    nethogs
    bandwhich
  ];

  # Direnv integration
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
