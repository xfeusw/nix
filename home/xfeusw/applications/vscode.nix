# home/xfeusw/applications/vscode.nix

{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;

    # User settings
    userSettings = {
      "workbench.sideBar.location" = "right";
      "workbench.colorTheme" = "Tokyo Night";
      "workbench.iconTheme" = "material-icon-theme";
      "explorer.confirmDragAndDrop" = false;
      "editor.tabSize" = 2;
    };

    # Extensions
    extensions = with pkgs.vscode-extensions; [
      alefragnani.project-manager
      alvarosannas.nix
      bbenoist.nix
      codezombiech.gitignore
      donjayamanne.git-extension-pack
      donjayamanne.githistory
      eamodio.gitlens
      enkia.tokyo-night
      mhutchie.git-graph
      pkief.material-icon-theme
      ziyasal.vscode-open-in-github
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Fallback for extensions not in nixpkgs
      # {
      #   name = "extension-name";
      #   publisher = "publisher-name";
      #   version = "1.0.0";
      #   sha256 = "sha256-...";
      # }
    ];

    # Keyboard shortcuts
    keybindings = [
      {
        key = "ctrl+shift+=";
        command = "workbench.action.terminal.toggleTerminal";
      }
    ];
  };
}
