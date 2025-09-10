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
  coreTools = import ./packages/system/core-tools.nix { inherit unstablePkgs; };
  cliUtils = import ./packages/system/cli-utils.nix { inherit unstablePkgs; };
  monitoring = import ./packages/system/monitoring.nix { inherit unstablePkgs; };

  # Apps
  browsers = import ./packages/apps/browsers.nix { inherit unstablePkgs; };
  chat = import ./packages/apps/chat.nix { inherit unstablePkgs; };
  media = import ./packages/apps/media.nix { inherit unstablePkgs; };
  editors = import ./packages/apps/editors.nix { inherit unstablePkgs; };
  others = import ./packages/apps/others.nix { inherit unstablePkgs; };

  # Dev
  languages = import ./packages/dev/languages.nix { inherit unstablePkgs; };
  tooling = import ./packages/dev/tooling.nix { inherit unstablePkgs; };

  # Fonts
  nerdFonts = import ./packages/fonts/nerd-fonts.nix { inherit unstablePkgs; };
  regularFonts = import ./packages/fonts/regular-fonts.nix { inherit unstablePkgs; };

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
    ++ others
    ++ languages
    ++ tooling
    ++ nerdFonts
    ++ regularFonts
    ++ [
      nixvim-config.packages.${pkgs.system}.default
    ];
}
