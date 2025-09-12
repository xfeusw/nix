# home/xfeusw/applications/communication.nix
{ unstable, ... }:
{
  home.packages = with unstable; [
    # Chat applications
    telegram-desktop
    discord
    signal-desktop

    # Email (if not using KMail)
    thunderbird

    # Video conferencing
    zoom-us

    # Remote desktop
    anydesk
  ];
}
