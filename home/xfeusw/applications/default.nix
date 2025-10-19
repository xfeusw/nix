{ pkgs, vscode, helix, ... }:
{
  imports = [
    vscode.homeManagerModules.vscode
    helix.homeManagerModules.default
  ];
  programs.vscode.enable = true;
  programs.helix.installExtraPackages = false;

  programs.yazi = {
    enable = true;

    # This sets up config.toml and themes.toml in ~/.config/yazi/

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
    discord

    # Media
    spotify
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
}

