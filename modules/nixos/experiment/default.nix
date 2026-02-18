{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.services.experimentalus;

  script = pkgs.writeShellScript "exampulus.sh" ''
    printf "something";
    cowsay
  '';
in {
  imports = [
  ];

  options = {
    services.experimentalus = {
      enable = lib.mkOption {
        default = false;
        example = true;
        type = with lib.types; bool;
        description = "Deploy the experimentalus service";
      };

      user = lib.mkOption {
        type = lib.types.str;
        default = "expius";
        example = "retardus";
        description = "User for running systemd service as";
      };

      group = lib.mkOption {
        type = lib.types.str;
        default = "expius";
        example = "retardus";
        description = "Group for user of running systemd service as";
      };

      dataDir = lib.mkOption {
        type = lib.types.str;
        default = "/var/lib/expius";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.user} = {
      description = "Experimentalus Service User";
      home = cfg.dataDir;
      useDefaultShell = true;
      group = cfg.group;
      isSystemUser = true;
    };

    users.groups.${cfg.group} = {};

    systemd.services.experimentalus = {
      description = "Experimentalus server service";
      documentation = ["https://google.com"];

      wantedBy = ["multi-user.target"];
      path = [script] ++ (with pkgs; [cowsay]);

      serviceConfig = {
        Type = "oneshot";
        User = cfg.user;
        Group = cfg.group;
        ExecStart = "${script}";
        StateDirectory = cfg.user;
        StateDirectoryMode = "0750";
      };
    };
  };
}
