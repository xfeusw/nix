# modules/packages/default.nix
{...}: {
  imports = [
    ./system-essentials.nix
    ./development-cli.nix
    ./media.nix
    ./fonts.nix
  ];
}
