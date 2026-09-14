# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  stdenv,
  ...
}:
let
  release-notes-assistant = inputs.release-notes-assistant.packages."x86_64-linux".default;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./modules.nix
    # ./cloudflared
  ];

  # Define your hostname.
  networking.hostName = "hyperion";

  # Set the keyboard layout.
  services.xserver.xkb = {
    layout = "uz";
    variant = "latin";
  };
  console.useXkbConfig = true;

  users.groups."relago" = { };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."xfeusw" = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
      "docker"
      "relago"
    ];
  };

  nix.settings.trusted-users = [
    "root"
    "xfeusw"
  ];

  # Allow unfree packages
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    libreoffice
    nautilus
    gnome-system-monitor
    # jetbrains-mono
    nil
    nixd
    git
    runc
    conmon
    skopeo
    slirp4netns
    fuse-overlayfs
    zoxide
    woeusb-ng
    ntfs3g
    ghostty
    telegram-desktop
    element-desktop
    fluffychat
    fastfetch
    # nerd-fonts.jetbrains-mono
    haskellPackages.tree-sitter-haskell
    haskellPackages.cabal-gild
    haskell-language-server
    nixfmt
    bazaar
    gnome-tweaks
    bibata-cursors
    # helvetica-neue-lt-std
    tree
    spotify
    helix
    # qemu_full
    yandex-music-bin
    postman
    fxlinuxprint
    foomatic-db-nonfree
    foomatic-db-ppds-withNonfreeDb
    treefmt
    resources
    cloudflared
    gnome-disk-utility
    nodejs_22
    pnpm_11
    spotiflac
    ffmpeg
    mpv
    vscode-langservers-extracted
    e-imzo-manager
    ngrok
    discord
    firefoxpwa
    release-notes-assistant
    qbittorrent
    audacity
  ];

  system.stateVersion = "26.11";

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/xfeusw/workspace/congeries/xinux-config/systems/x86_64-linux/hyperion/default.nix";
    flake = "/home/xfeusw/workspace/congeries/xinux-config/flake.nix";
    hostname = "hyperion";
  };


  programs.nix-ld.enable = true;

  nixpkgs.overlays = [ inputs.yandex-music.overlays.default ];

  # services.relago-server = {
  #   enable = true;
  #   osPassword = "Str0ng!Passw0rd@2025";
  #   s3KeyId = "GKf39328305ea6dad6b4831a7e";
  #   s3SecretKey = "ed6f8f8f2a300602e1acaab2fbf5b856658a9a04cb33c2b20903159133917c12";
  #   s3MainBucket = "default-bucket";
  # };

  # services.relago = {
  #   enable = true;
  #   nix-config = "/home/xfeusw/.config/nix";
  #   server = "http://localhost:4242";
  # };

  services.pipewire.jack.enable = true;

  services.x2goserver.enable = true;

  services.e-imzo.enable = true;

  nix.settings.substituters = [ "https://cache.xinux.uz?priority=10" ];
  nix.settings.trusted-public-keys = [
    "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
  ];
}
