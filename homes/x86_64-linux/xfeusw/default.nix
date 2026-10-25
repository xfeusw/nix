{
  config,
  pkgs,
  lib,
  inputs,
  system,
  ...
}:
let
  accela = inputs.enter-the-wired.packages.${pkgs.system}.default;
in
{
  imports = [
    ./gaming.nix
  ];

  home = {
    stateVersion = "26.11";
    username = "xfeusw";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    settings = {
      "ssh.tunnelcha.uz" = {
        Hostname = "ssh.tunnelcha.uz";
        User = "xfeusw";
        ProxyCommand = "cloudflared access ssh --hostname %h";
      };
    };
  };

  home.activation.fixSteamIcons = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    for f in ~/.local/share/applications/*.desktop; do
      id=$(grep -Eo 'steam://rungameid/[0-9]+' "$f" | sed 's#.*/##') || true
      [ -n "$id" ] || continue

      last=$(tail -n1 "$f" || true)
      want="StartupWMClass=steam_app_$id"

      [ "$last" = "$want" ] || echo "$want" >> "$f"
    done
  '';

  # services.sls-steam.config = {
  #   PlayNotOwnedGames = true;

  # };

  home.packages = [
    accela
    inputs.freesmlauncher.packages.${system}.freesmlauncher
    pkgs.github-cli
    pkgs.forgejo-cli
    pkgs.devenv
  ];

  home.shellAliases = {
    berg = "fj --host codeberg.org";
    fg = "fj --host git.oss.uzinfocom.uz";
  };

  spotify-xfeusw.enable = true;
}
