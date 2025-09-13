# home/xfeusw/development/languages/python.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Python tools
    # python312Packages.pip
    # python312Packages.pipx
    # python312Packages.virtualenv
    # poetry

    # Development tools
    # python312Packages.black
    # python312Packages.isort
    # python312Packages.flake8
    # python312Packages.mypy
    # python312Packages.pytest

    # Language server
    # python312Packages.python-lsp-server
  ];
}
