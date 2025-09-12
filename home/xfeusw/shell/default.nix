# home/xfeusw/shell/default.nix
{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    # Modern CLI replacements
    bat # cat replacement
    eza # ls replacement
    fd # find replacement
    ripgrep # grep replacement
    zoxide # cd replacement
    fzf # fuzzy finder

    # System monitoring
    bottom # top replacement
    dust # du replacement
    procs # ps replacement

    # Network tools
    bandwhich # network bandwidth monitor
    dogdns # DNS lookup tool
  ];
}
