# modules/packages/system-essentials.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    git
    git-filter-repo
    wget
    curl
    home-manager
    xclip
    wl-clipboard
    neofetch
    pavucontrol

    # Modern CLI tools
    bat # Better cat
    eza # Better ls
    fd # Better find
    ripgrep # Better grep
    zoxide # Smart cd
    fzf # Fuzzy finder
    dust # Better du
    procs # Better ps

    # System monitoring tools
    htop
    iotop
    lsof
    strace
    sysstat
    usbutils
    pciutils

    nvidia-vaapi-driver
    nvtopPackages.nvidia
  ];

  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal" = true;
      "gfx.webrender.all" = true;
      "mozilla.widget.use-wayland" = 1; # Explicit Wayland support
    };
  };
}
