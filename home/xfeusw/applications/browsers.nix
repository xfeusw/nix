# home/xfeusw/applications/browsers.nix
{ unstable, ... }:
{
  home.packages = with unstable; [
    # Browsers
    brave
    firefox-devedition
    google-chrome
    tor-browser

    # Browser tools
    browserpass # Pass integration
  ];
}
