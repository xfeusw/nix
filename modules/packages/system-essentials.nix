# modules/packages/system-essentials.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    git
    wget
    curl
    home-manager
    xclip
    wl-clipboard
    neofetch

    # Modern CLI tools
    bat # Better cat
    eza # Better ls
    fd # Better find
    ripgrep # Better grep
    zoxide # Smart cd
    fzf # Fuzzy finder
    btop # Better top
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
  ];
}
