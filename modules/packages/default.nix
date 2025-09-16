# modules/packages/default.nix
{ ... }:
{
  imports = [
    ./system-essentials.nix
    ./development-cli.nix
    ./gnome.nix
    ./media.nix
    ./fonts.nix
  ];
}
