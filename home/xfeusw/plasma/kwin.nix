# home/xfeusw/desktop/plasma/kwin.nix
{ ... }:
{
  programs.plasma = {
    kwin = {
      # Window behavior and rules
      borderlessMaximizedWindows = true;

      virtualDesktops = {
        number = 4;
        rows = 1;
      };
    };

    # Window rules using configFile
    configFile = {
      "kwinrc" = {
        Windows = {
          BorderlessMaximizedWindows = true;
          Placement = "Centered";
          SeparateScreenFocus = true;
          FocusPolicy = "FocusFollowsMouse";
          FocusStealingPreventionLevel = 1;
          ActiveMouseScreen = true;
        };

        Compositing = {
          # Disable heavy effects for performance
          GLCore = true;
          HiddenPreviews = 5;
          OpenGLIsUnsafe = false;
        };

        Effect-diminactive = {
          Strength = 5;
        };

        Plugins = {
          blurEnabled = false;
          contrastEnabled = false;
          desktopgridEnabled = false;
          coverswitchEnabled = false;
          cubeEnabled = false;
          flipswitchEnabled = false;
          # Enable useful effects
          fadeEnabled = true;
          glideEnabled = true;
          scaleEnabled = true;
          slideEnabled = true;
          highlightwindowEnabled = true;
          minimizeanimationEnabled = true;
          mousemarkEnabled = true;
          startupfeedbackEnabled = true;
        };
      };

      "kwinrulesrc" = {
        "1" = {
          Description = "Force CS2 and Steam games to be borderless";
          wmclass = "cs2";
          wmclassmatch = 1;
          noborder = true;
          noborderrule = 2;
          types = 1;
        };

        "2" = {
          Description = "Steam games";
          wmclass = "steam_app.*";
          wmclassmatch = 3;
          noborder = true;
          noborderrule = 2;
          types = 1;
        };

        General = {
          count = 2;
          rules = "1,2";
        };
      };
    };
  };
}
