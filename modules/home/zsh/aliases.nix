{ pkgs, ... }:
{
  programs.zsh.shellAliases = {
    # Modern CLI tools
    ls = "eza --color=auto --icons --group-directories-first";
    ll = "eza -la --color=auto --icons --group-directories-first";
    la = "eza -la --color=auto --icons --group-directories-first";
    tree = "eza --tree --icons";
    cat = "bat --paging=never";

    # Git shortcuts
    g = "git";
    gs = "git status -sb";
    ga = "git add";
    gaa = "git add --all";
    gfa = "git fetch --all";
    gc = "git commit";
    gcm = "git commit -m";
    gp = "git push";
    gpl = "git pull";
    gd = "git diff";
    gdc = "git diff --cached";
    gl = "git log --oneline --graph --decorate";
    gla = "git log --oneline --graph --decorate --all";

    # NixOS management (Customize paths as needed)
    check = "nix flake check";
    nix-search = "nix search nixpkgs";

    # Development shortcuts
    dev = "nix develop";
    run = "nix run";
    shell = "nix shell";

    # System shortcuts
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";

    # Quick navigation
    config = "cd ~/.config";
    nix-config = "cd ~/.config/nix";

    # Docker/Podman
    docker = "podman";

    # System info
    ports = "ss -tuln";

    zed = "zeditor";
    lg = "lazygit";
  };
}
