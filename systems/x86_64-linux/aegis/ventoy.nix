{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ventoy-full-gtk
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.17"
  ];
}
