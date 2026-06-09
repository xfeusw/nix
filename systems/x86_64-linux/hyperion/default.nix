# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./modules.nix
  ];

  # Define your hostname.
  networking.hostName = "hyperion";

  # Set the keyboard layout.
  services.xserver.xkb = {
    layout = "uz";
    variant = "latin";
  };
  console.useXkbConfig = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."xfeusw" = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
      "podman"
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
    jetbrains-mono
    nil
    nixd
    git
    podman
    podman-compose
    pods
    podman-tui
    runc
    conmon
    skopeo
    slirp4netns
    fuse-overlayfs
    zoxide
    ventoy-full-gtk
    woeusb-ng
    ntfs3g
    ghostty
    telegram-desktop
    element-desktop
    fluffychat
    fastfetch
    nerd-fonts.jetbrains-mono
    haskellPackages.tree-sitter-haskell
    haskellPackages.cabal-gild
    haskell-language-server
    alejandra
    bazaar
    gnome-tweaks
    bibata-cursors
    helvetica-neue-lt-std
    tree
    spotify
    helix
    rPackages.figma
    qemu_full
    yandex-music-bin
    slidev-cli
    postman
  ];

  system.stateVersion = "26.11";

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/xfeusw/.config/nix/systems/x86_64-linux/hyperion/default.nix";
    flake = "/home/xfeusw/.config/nix/flake.nix";
    flakearg = "hyperion";
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.12"
    "ventoy-gtk3-1.1.12"
  ];

  programs.nix-ld.enable = true;

  nixpkgs.overlays = [ inputs.yandex-music.overlays.default ];

  services.relago-server = {
    enable = true;
    osPassword = "Str0ng!Passw0rd@2025";
    s3KeyId = "GKf39328305ea6dad6b4831a7e";
    s3SecretKey = "ed6f8f8f2a300602e1acaab2fbf5b856658a9a04cb33c2b20903159133917c12";
    s3MainBucket = "default-bucket";
  };

  services.relago = {
    enable = true;
    nix-config = "/home/xfeusw/.config/xinux-config";
    server = "http://localhost:4242";
  };
}
