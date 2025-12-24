{inputs, ...}: {
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager

    ./workspace.nix
    ./applications.nix
    ./kwin.nix
    ./integration.nix
    ./themes.nix
    ./packages.nix
  ];
}
