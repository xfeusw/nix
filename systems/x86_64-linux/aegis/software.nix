{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  environment.systemPackages = with pkgs; [
    nautilus
    jetbrains-mono
    ghostty
    telegram-desktop
    element-desktop
    gnome-tweaks
    bibata-cursors
    cameractrls-gtk4
    loupe
    gnome-clocks
    solaar

    nil
    nixd
    nixfmt
    treefmt
    git
    helix
    haskellPackages.tree-sitter-haskell
    haskellPackages.cabal-gild
    haskell-language-server
    postman

    zoxide
    fastfetch
    tree

    cloudflared
    ngrok

    # spotify
    discord
    mpv
    celluloid
    makemkv
    shntool
    flac
    flacon
    spotiflac
    evince
    ghostscript
    bazaar
    baobab

    woeusb-ng
    ntfs3g
    gparted
    gnome-disk-utility
    qbittorrent

    tor-browser
  ];

  zramSwap = {
    enable = true;
    memoryPercent = 200;
    algorithm = "zstd";
  };

  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  nixpkgs.overlays = [
    inputs.yandex-music.overlays.default
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  nix.settings.substituters = [
    "https://cache.xinux.uz?priority=10"
    "https://cache.nixos.org/"
  ];

  nix.settings.trusted-public-keys = [
    "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
  ];
}
