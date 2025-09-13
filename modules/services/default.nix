# modules/services/default.nix
{ ... }:
{
  imports = [
    ./printing.nix
    ./location.nix
    ./database.nix
    ./system-programs.nix
  ];
}
