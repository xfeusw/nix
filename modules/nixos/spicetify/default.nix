{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  bloom = {
    name = "bloom";

    src =
      (pkgs.fetchFromGitHub {
        owner = "nimsandu";
        repo = "spicetify-bloom";
        rev = "654cfed682b94613b0029997ffafc1eadccc5bef";
        hash = "sha256-+pIf2N/yR8XwltRStSePUWDkm2x96hBbDrHbCF8a86k=";
      })
      + "/src";
  };

  dynamic =
    let
      dynamicThemeSrc = pkgs.fetchFromGitHub {
        owner = "JulienMaille";
        repo = "spicetify-dynamic-theme";
        rev = "b3bf02df904b71cde74aedd113cba5258c613047";
        hash = "sha256-FE6zXO6leEUX1b7Tu6/GYV3sNHT6Y/c9EJUn9pmP/xs=";
      };
    in
    {
      name = "DefaultDynamic";

      src = dynamicThemeSrc;

      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      homeConfig = true;
      sidebarConfig = true;
      overwriteAssets = true;

      requiredExtensions = [
        {
          src = dynamicThemeSrc;
          name = "default-dynamic.js";
        }
        {
          src = dynamicThemeSrc;
          name = "Vibrant.min.js";
        }
      ];
    };

  cleanest = {
    name = "Cleanest";

    src = pkgs.fetchFromGitHub {
      owner = "Alex-Scuf";
      repo = "Cleanest";
      rev = "main";
      hash = "sha256-bOlIlLTQGJfIB+RynKiJbTtp559OA2Dk0xeOPu+hd78=";
    };
  };
in
{
  programs.spicetify = {
    enable = true;

    alwaysEnableDevTools = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      autoSkipVideo
      beautifulLyrics
      aiBandBlocker
    ];
    enabledCustomApps = with spicePkgs.apps; [
      # newReleases
      # ncsVisualizer
      # reddit
      # lyricsPlus
      marketplace
      # betterLibrary
      # historyInSidebar
    ];
    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
      pointer
    ];

    theme = dynamic;
    colorScheme = "Base";
  };
}

# https://github.com/nimsandu/spicetify-bloom
