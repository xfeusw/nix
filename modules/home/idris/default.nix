{pkgs, ...}: {
  home.packages = with pkgs; [
    idris2
    chez
    idris2Packages.idris2Lsp
    idris2Packages.pack
  ];
}
