{ pkgs, vscode, helix, config, inputs, ... }:
{
  imports = [
    vscode.homeManagerModules.vscode
    helix.homeManagerModules.default
  ];
  programs.vscode.enable = true;
  programs.helix.installExtraPackages = false;

  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
        editor = "hx";
      };

      preview = {
        enable = true;
        max_width = 120;
        max_height = 80;
      };
    };

    # Optional: custom keybindings
    keymap = {
      normal = {
        "e" = "open"; # press e to edit in Helix
        "ctrl-y" = "cd .."; # example remap
      };
    };

    # Optional theme override (if you want to customize colors)
    theme = {
      mgr = {
        border = "blue";
        selection = "bold yellow";
      };
    };
  };


  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  home.packages = with pkgs.unstable; [
    # Browsers
    brave
    firefox-devedition
    google-chrome
    tor-browser

    # Communication
    telegram-desktop
    element-desktop
    ayugram-desktop
    discord

    # Media
    spotify
    spotify-tray
    spotify-cli-linux
    playerctl
    vlc
    mpv

    # Productivity
    pdftk
    unrar
    p7zip
    copyq

    # Text editors
    vscode
    zed-editor

    # yazi
  ];

  # programs.spicetify =
  # let
  #   spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  # in
  # {
  #   enable = true;

  #   enabledExtensions = with spicePkgs.extensions; [
  #     adblock
  #     hidePodcasts
  #     shuffle # shuffle+ (special characters are sanitized out of extension names)
  #   ];
  #   enabledCustomApps = with spicePkgs.apps; [
  #     newReleases
  #     ncsVisualizer
  #   ];
  #   enabledSnippets = with spicePkgs.snippets; [
  #     rotatingCoverart
  #     pointer
  #   ];

  #   theme = spicePkgs.themes.catppuccin;
  #   colorScheme = "mocha";
  # };

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        backend = "pulseaudio";
        device_name = "nixos-acer";
        volume_controller = "softvol";
        cache_path = "${config.xdg.cacheHome}/spotifyd";
        bitrate = 320;
        # username = "youremail@example.com";
        # password_cmd = "cat /run/keys/spotify_pass";
      };
    };
  };
}
