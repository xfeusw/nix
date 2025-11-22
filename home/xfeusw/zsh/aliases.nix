{pkgs, ...}: {
  programs.zsh.shellAliases = {
    # Modern CLI tools
    ls = "eza --color=auto --icons --group-directories-first";
    ll = "eza -la --color=auto --icons --group-directories-first";
    la = "eza -la --color=auto --icons --group-directories-first";
    tree = "eza --tree --icons";
    cat = "bat --paging=never";
    grep = "rg";
    find = "fd";
    du = "dust";
    df = "dust";
    top = "btop";
    ps = "procs";

    # Git shortcuts
    g = "git";
    gs = "git status -sb";
    ga = "git add";
    gaa = "git add --all";
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
    build-xeon = "sudo nixos-rebuild build --flake ~/.config/nix#xeon --option restrict-eval false";
    switch-xeon = "sudo nixos-rebuild switch --flake ~/.config/nix#xeon --option restrict-eval false";
    update-xeon = "sudo nixos-rebuild switch --flake ~/.config/nix#xeon --upgrade --option restrict-eval false";

    build-acer = "sudo nixos-rebuild build --flake ~/.config/nix#acer --option restrict-eval false";
    switch-acer = "sudo nixos-rebuild switch --flake ~/.config/nix#acer --option restrict-eval false";
    update-acer = "sudo nixos-rebuild switch --flake ~/.config/nix#acer --upgrade --option restrict-eval false";

    build-home = "home-manager build --flake ~/.config/nix#xfeusw --option restrict-eval false -b backup";
    switch-home = "home-manager switch --flake ~/.config/nix#xfeusw --option restrict-eval false -b backup";
    update-home = "home-manager switch --flake ~/.config/nix#xfeusw --option restrict-eval false -b backup";

    nix-clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d && home-manager expire-generations 0 && sudo nix-store --optimise";
    nix-search = "nix search nixpkgs";

    # Development shortcuts
    dev = "nix develop";
    run = "nix run";
    shell = "nix shell";

    # System shortcuts
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    # Quick navigation
    config = "cd ~/.config";
    nix-config = "cd ~/.config/nix";

    # Docker/Podman
    docker = "podman";

    # System info
    temp = "sensors";
    ports = "ss -tuln";
  };
}
