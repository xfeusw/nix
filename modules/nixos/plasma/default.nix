{
  pkgs,
  lib,
  ...
}: {
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings.Theme = {
        Current = "breeze";
        Font = "JetBrains Mono,10,-1,5,50,0,0,0,0,0";
      };
    };

    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.ark
    kdePackages.kcalc
    kdePackages.sddm-kcm
    qt6.qtwayland
    kdePackages.xdg-desktop-portal-kde
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    config.common.default = ["kde" "gtk"];
  };
}
