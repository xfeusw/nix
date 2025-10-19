{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
    profiles.default = {
      userSettings = {
        # --- UI ---
        "workbench.sideBar.location" = "right";
        "workbench.colorTheme" = "Tokyo Night";
        "workbench.iconTheme" = "material-icon-theme";
        "explorer.confirmDragAndDrop" = false;
        "editor.tabSize" = 2;
        # --- Privacy & performance ---
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
        # --- Editing behavior ---
        "editor.formatOnSave" = false;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = true;
        };
        "search.followSymlinks" = false;
        "git.autofetch" = false;
        # --- Rust ---
        "rust-analyzer.server.path" = ""; # Provided by devShell
        "rust-analyzer.cargo.runBuildScripts" = true;
        "rust-analyzer.cargo.loadOutDirsFromCheck" = true;
        "rust-analyzer.procMacro.enable" = true;
        "rust-analyzer.checkOnSave.command" = "clippy";
        "rust-analyzer.imports.granularity.group" = "module";
        "rust-analyzer.imports.prefix" = "crate";
        "rust-analyzer.inlayHints.enable" = true;
        "rust-analyzer.diagnostics.disabled" = [ "unresolved-proc-macro" ];
        # --- Haskell ---
        "haskell.formattingProvider" = "fourmolu";
        "haskell.plugin.ghcide-completions.globalOn" = true;
        "haskell.hlintOn" = true;
        "haskell.trace.server" = "off";
        # --- Language associations ---
        "[nix]" = {
          "editor.defaultFormatter" = "kamadorueda.alejandra";
        };
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        # --- UX polish ---
        "workbench.startupEditor" = "none";
        "editor.minimap.enabled" = false;
        "breadcrumbs.enabled" = true;
        "window.titleBarStyle" = "custom";
        "files.hotExit" = "off";
      };
      extensions = with pkgs.vscode-extensions; [
        # Nix support
        bbenoist.nix
        kamadorueda.alejandra
        # UI/Theme
        pkief.material-icon-theme
        enkia.tokyo-night
        # Language support
        rust-lang.rust-analyzer
        haskell.haskell
        tamasfe.even-better-toml
        # Essential tools
        vadimcn.vscode-lldb
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-just-syntax";
          publisher = "nefrob";
          version = "0.8.0";
          sha256 = "sha256-zuDfIxhiUKRpVRxp9BceW6WPBq5NNCuS1Si0/6kfqF8=";
        }
        {
          name = "dotenv";
          publisher = "mikestead";
          version = "1.0.1";
          sha256 = "sha256-dieCzNOIcZiTGu4Mv5zYlG7jLhaEsJR05qbzzzQ7RWc=";
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
