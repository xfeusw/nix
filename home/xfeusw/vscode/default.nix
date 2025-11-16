{ pkgs, ... }: let
  vscodeExtensions = import ./extensions.nix { inherit pkgs; };
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
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
        "rust-analyzer.server.path" = "";
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

      extensions = vscodeExtensions;

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
