{
  pkgs,
  inputs,
  system,
  treefmtEval,
}: let
  pre-commit-check = inputs.git-hooks.lib.${system}.run {
    src = ./.;
    hooks = {
      treefmt.enable = true;
      check-merge-conflicts.enable = true;
    };
  };

  gitHooksPackages = pre-commit-check.enabledPackages;
  gitHooksShellHook = pre-commit-check.shellHook;

  treefmt = treefmtEval.config.build.wrapper;
in
  pkgs.mkShell {
    name = "nixos-config-devshell";

    packages =
      [
        treefmt
      ]
      ++ gitHooksPackages
      ++ (with pkgs; [
        # Nix tools
        nil
        alejandra
        nixpkgs-fmt
        deadnix
        nix-tree
        nix-diff
        nvd

        # Development tools
        git
        gh

        # File management
        fd
        ripgrep

        # Secrets management (for sops-nix)
        sops
        age
        ssh-to-age

        # Documentation
        manix

        # Testing and validation
        nixos-rebuild
        home-manager

        shfmt
      ]);

    shellHook = ''
      echo "🚀 NixOS Configuration Development Shell"
      ${gitHooksShellHook}
    '';
  }
