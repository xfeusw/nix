{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Essential CLI tools
    bat
    eza
    fd
    ripgrep
    zoxide
    fzf
    btop

    # Build essentials (needed by many toolchains)
    gcc
    cmake
    gnumake
    pkg-config

    # Debuggers
    gdb
    lldb

    # Version control
    git-lfs
    gh
    lazygit

    # Container tools
    docker-compose
    kubectl
    k9s

    # API tools
    httpie
    curl
    wget

    # Text processing
    jq
    yq

    # System tools
    tree
    unzip

    # Nix tools
    cachix
    direnv
    just

    unstable.dockerfile-language-server-nodejs
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
