{pkgs, ...}: {
  projectRootFile = "flake.nix";

  programs = {
    alejandra.enable = true;

    shfmt = {
      enable = true;
      indent_size = 2;
    };

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

      shfmt = {
        options = [];
        priority = 3;
      };

      mdformat = {
        options = [];
        priority = 5;
      };
    };
  };
}
