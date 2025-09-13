# modules/packages/default.nix
{ ... }:
{
  imports = [
    ./system-essentials.nix
    ./development-cli.nix
    ./plasma.nix
    ./media.nix
    ./fonts.nix
  ];
}
