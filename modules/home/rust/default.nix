{pkgs, ...}: {
  home.packages = with pkgs; [
    rustc
    rust-analyzer
    cargo
    clippy
    gcc
  ];
}
