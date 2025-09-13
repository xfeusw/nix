# home/xfeusw/applications/communication.nix
{ unstable, ... }:
{
  home.packages = with unstable; [
    # Chat applications
    telegram-desktop
    discord

    # Video conferencing
    zoom-us

    # Remote desktop
    anydesk
  ];
}
