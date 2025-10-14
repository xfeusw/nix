{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;

    profiles.default = {
      userSettings = {
        # UI
        "workbench.sideBar.location" = "right";
        "workbench.colorTheme" = "Tokyo Night";
        "workbench.iconTheme" = "material-icon-theme";
        "explorer.confirmDragAndDrop" = false;
        "editor.tabSize" = 2;

        # General performance & privacy
        "telemetry.enableTelemetry" = false;
        "telemetry.enableCrashReporter" = false;
        "extensions.autoUpdate" = true;
        "extensions.autoCheckUpdates" = true;
        "files.watcherExclude" = {
          "**/node_modules/**" = true;
          "**/.git/**" = true;
          "**/target/**" = true;
          "**/.stack-work/**" = true;
          "**/dist-newstyle/**" = true;
          "**/.ghc/**" = true;
        };
        "files.exclude" = {
          "**/target" = true;
          "**/.stack-work" = true;
          "**/dist-newstyle" = true;
          "**/.ghc" = true;
          "**/.cache" = true;
          "**/node_modules" = true;
        };

        # Editor behaviour
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = true;
        };
        "search.followSymlinks" = false;
        "git.autofetch" = false;

        # Rust
        "rust-analyzer.server.path" = ""; # will be found in flake dev shell
        "rust-analyzer.cargo.runBuildScripts" = true;
        "rust-analyzer.cargo.loadOutDirsFromCheck" = true;
        "rust-analyzer.procMacro.enable" = true;
        "rust-analyzer.checkOnSave.command" = "clippy";

        # Haskell
        "haskell.formattingProvider" = "fourmolu"; # use your project’s flake-provided formatter
        "haskell.plugin.ghcide-completions.globalOn" = true;
        "haskell.hlintOn" = true;
        "haskell.trace.server" = "off";

        # Formatters per-language
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        "[haskell]" = {
          "editor.defaultFormatter" = "Haskell.haskell"; # delegate to project’s fourmolu in flake
        };
      };

      extensions = with pkgs.vscode-extensions; [
        # Core UX
        bbenoist.nix
        eamodio.gitlens
        enkia.tokyo-night
        mhutchie.git-graph
        pkief.material-icon-theme

        # Rust & Haskell support (LSPs loaded from project env)
        rust-lang.rust-analyzer
        haskell.haskell

        # Productivity & debugging
        vadimcn.vscode-lldb
        serayuzgur.crates
        ms-vscode.cpptools
        ms-python.python
        usernamehw.errorlens
        ms-vscode-remote.remote-containers
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "nix";
          publisher = "alvarosannas";
          version = "0.0.1";
          sha256 = "l5hQL9vgJLF3GiH5bjog9+SKWsDfy3lm5/mC8H0r7Hw=";
        }
        {
          name = "gitignore";
          publisher = "codezombiech";
          version = "0.6.0";
          sha256 = "sha256-C6gY9hSD87oXcHP3dXg2QwC53a1L4UaRTm3yG5IBzD4=";
        }
        {
          name = "githistory";
          publisher = "donjayamanne";
          version = "0.6.20";
          sha256 = "sha256-nEdYS9/cMS4dcbFje23a47QBZr9eDK3dvtkFWqA+OHU=";
        }
      ];

      keybindings = [
        {
          key = "ctrl+shift+=";
          command = "workbench.action.terminal.toggleTerminal";
        }
        {
          key = "ctrl+alt+f";
          command = "editor.action.formatDocument";
        }
      ];
    };
  };
}
