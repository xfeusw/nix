# home/xfeusw/packages.nix
{
  pkgs,
  unstable ? null,
  nixvim-config,
  ...
}:
let
  unstablePkgs =
    if unstable != null then
      unstable
    else
      import <nixpkgs-unstable> {
        system = pkgs.system;
        config.allowUnfree = true;
      };

  # System
  coreTools = import ./packages/system/core-tools.nix { inherit pkgs unstablePkgs; };
  cliUtils = import ./packages/system/cli-utils.nix { inherit pkgs unstablePkgs; };
  monitoring = import ./packages/system/monitoring.nix { inherit pkgs unstablePkgs; };

  # Apps
  browsers = import ./packages/apps/browsers.nix { inherit pkgs unstablePkgs; };
  chat = import ./packages/apps/chat.nix { inherit pkgs unstablePkgs; };
  media = import ./packages/apps/media.nix { inherit pkgs unstablePkgs; };
  editors = import ./packages/apps/editors.nix { inherit pkgs unstablePkgs; };

  # Dev
  languages = import ./packages/dev/languages.nix { inherit pkgs unstablePkgs; };
  tooling = import ./packages/dev/tooling.nix { inherit pkgs unstablePkgs; };

  # Fonts
  nerdFonts = import ./packages/fonts/nerd-fonts.nix { inherit pkgs unstablePkgs; };
  regularFonts = import ./packages/fonts/regular-fonts.nix { inherit pkgs unstablePkgs; };

in
{
  home.packages =
    coreTools
    ++ cliUtils
    ++ monitoring
    ++ browsers
    ++ chat
    ++ media
    ++ editors
    ++ languages
    ++ tooling
    ++ nerdFonts
    ++ regularFonts
    ++ [
      nixvim-config.packages.${pkgs.system}.default
    ];
}
