# modules/backup.nix
{ ... }:
{
  # Restic backup service
  services.restic.backups = {
    localbackup = {
      initialize = true;
      repository = "/backup/restic";
      passwordFile = "/etc/nixos/secrets/restic-password";
      paths = [
        "/home/xfeusw/Documents"
        "/home/xfeusw/.config"
        "/home/xfeusw/Pictures"
      ];
      exclude = [
        "/home/xfeusw/.cache"
        "/home/xfeusw/.local/share/Trash"
        "*.tmp"
        "*~"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 3"
      ];
    };
  };

  # Create backup directory and password file
  system.activationScripts.backup-setup = ''
    mkdir -p /backup
    if [ ! -f /etc/nixos/secrets/restic-password ]; then
      mkdir -p /etc/nixos/secrets
      echo "change-this-password" > /etc/nixos/secrets/restic-password
      chmod 600 /etc/nixos/secrets/restic-password
    fi
  '';
}
