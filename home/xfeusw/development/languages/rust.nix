# home/xfeusw/development/languages/rust.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Rust toolchain
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    rustlings

    # Additional Rust tools
    cargo-watch
    cargo-edit
    cargo-audit
    cargo-outdated
  ];
}
