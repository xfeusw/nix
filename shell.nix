{
  pkgs,
  treefmt,
  gitHooksShellHook,
  gitHooksPackages,
}:
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
      statix
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
    ]);

  shellHook = ''
    echo "🚀 NixOS Configuration Development Shell"
    ${gitHooksShellHook}
  '';
}
