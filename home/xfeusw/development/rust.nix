{pkgs, ...}: {
  config = {
    home = {
      file.".rustfmt.toml".text = ''
        edition = "2024"
        max_width = 100
        tab_spaces = 4
        hard_tabs = false
        use_small_heuristics = "Max"
      '';
      packages = [
        pkgs.rustc
        pkgs.rust-analyzer
        pkgs.cargo
        pkgs.clippy
        pkgs.rustfmt
      ];
    };
  };
}
