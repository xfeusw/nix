# home/xfeusw/desktop/plasma/default.nix
{...}: {
  imports = [
    ./workspace.nix
    ./applications.nix
    ./kwin.nix
    ./integration.nix
    ./themes.nix
    ./packages.nix
  ];
}
