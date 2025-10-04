# home/xfeusw/desktop/plasma/kwin.nix
{ ... }:
{
  programs.plasma = {
    kwin = {
      # Window behavior and rules
      settings = {
        BorderlessMaximizedWindows = true;
        ClickToFocus = true;
        FocusPolicy = "Click";
        Hiding = "Disabled";
        Placement = "Centered";
        SeparateScreenFocus = true;
        ShadeHover = false;
        ActiveMouseScreen = true;
        Autoraise = false;
        AutoraiseInterval = 0;
        DelayFocusInterval = 0;
        FocusStealingPreventionLevel = 1;
        # Window rules for specific applications
        WindowsRules."Application settings" = {
          Description = "Application settings";
          wmclass = "systemsettings";
          position = "0,0";
          size = "1024,768";
        };
      };

      # Visual effects (disabled for performance)
      effects = {
        # Disable heavy effects
        blur = false;
        desktopGrid = false;
        coverSwitch = false;
        cube = false;
        flipSwitch = false;
        # Keep useful effects enabled
        fade = true;
        glide = true;
        scale = true;
        sheet = true;
        slide = true;
        # Window management effects
        highlightWindow = true;
        magiceye = false;
        maximusanimation = false;
        minimizeanimation = true;
        # Mouse effects
        mouseMark = true;
        mouseClick = false;
        # Desktop effects
        dashboards = false;
        logout = true;
        startupfeedback = true;
      };

      # Window rules for specific applications
      configFile."kwinrulesrc" = {
        "1".Description = "Force CS2 and Steam games to be borderless";
        "1".wmclass = "cs2";
        "1".noborder = true;
        "1".noborderrule = 2;
        "1".types = 1;

        "2".Description = "Steam games";
        "2".wmclass = "steam_app*";
        "2".noborder = true;
        "2".noborderrule = 2;
        "2".types = 1;
      };
    };
  };
}
