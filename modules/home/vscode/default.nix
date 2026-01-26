{pkgs, ...}: let
  vscodeExtensions = import ./extensions.nix {inherit pkgs;};
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
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
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
        # --- Fonts ---
        "editor.fontFamily" = "FiraCode Nerd Font";
        "editor.fontSize" = 13;
        "editor.lineHeight" = 21;
        "editor.fontLigatures" = true;

        "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
        "terminal.integrated.fontSize" = 13;
        "terminal.integrated.lineHeight" = 1.2;
        # --- Rust ---
        "rust-analyzer.server.path" = "";
        "rust-analyzer.cargo.runBuildScripts" = true;
        "rust-analyzer.cargo.loadOutDirsFromCheck" = true;
        "rust-analyzer.procMacro.enable" = true;
        "rust-analyzer.checkOnSave.command" = "clippy";
        "rust-analyzer.imports.granularity.group" = "module";
        "rust-analyzer.imports.prefix" = "crate";
        "rust-analyzer.inlayHints.enable" = true;
        "rust-analyzer.diagnostics.disabled" = ["unresolved-proc-macro"];
        # --- Haskell ---
        "haskell.formattingProvider" = "fourmolu";
        "haskell.plugin.ghcide-completions.globalOn" = true;
        "haskell.hlintOn" = true;
        "haskell.trace.server" = "off";
        "files.associations" = {
          "*.hs" = "haskell";
          "*.lhs" = "literate haskell";
          "*.hs-boot" = "haskell";
          "*.cabal" = "cabal";
        };
        "haskell.serverExecutablePath" = "${pkgs.haskell-language-server}/bin/haskell-language-server-wrapper";
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
        "window.restoreWindows" = "none";
        "settingsSync.enable" = false;
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
