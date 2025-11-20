{_}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "ghostty";
        font = "JetBrains Mono:size=11";
        dpi-aware = "yes";
      };
      colors = {
        background = "1a1b26dd";
        text = "c0caf5ff";
        match = "7aa2f7ff";
        selection = "414868ff";
        selection-text = "c0caf5ff";
      };
    };
  };
}
