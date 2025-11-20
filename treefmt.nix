{pkgs, ...}: {
  projectRootFile = "flake.nix";

  programs = {
    alejandra.enable = true;

    prettier = {
      enable = true;
      settings = {
        editorconfig = true;
      };
    };

    shfmt = {
      enable = true;
      indent_size = 2;
    };

    shellcheck.enable = true;

    mdformat.enable = true;
  };

  settings = {
    global = {
      excludes = [
        "*.age"
        "*.key"
        "*.pem"
        "*.asc"

        ".git/**"
        ".gitignore"

        ".direnv/**"
        "result"
        "result-*"

        ".vscode/**"
        ".idea/**"
        "*.swp"
        "*.swo"
        "*~"

        "node_modules/**"
        ".terraform/**"

        "*.log"
        "*.lock"
      ];
    };

    formatter = {
      alejandra = {
        options = ["--quiet"];
        priority = 1;
      };

      prettier = {
        options = [
          "--write"
          "--tab-width"
          "2"
        ];
        priority = 2;
      };

      shfmt = {
        options = [
          "-i"
          "2"
          "-s"
          "-w"
        ];
        priority = 3;
      };
    };
  };
}
