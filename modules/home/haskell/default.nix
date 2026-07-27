{ pkgs, ... }:
let
  h = pkgs.haskell.packages.ghc912;
  hpkgs = pkgs.haskellPackages;
  htools = pkgs.buildEnv {
    name = "haskell-tooling";
    paths = [
      h.cabal-install
      h.haskell-language-server
      hpkgs.cabal-fmt
      h.fourmolu
      h.hlint
      h.hoogle
      h.cabal-hoogle
    ];
    pathsToLink = [
      "/bin"
      "/share"
    ];
  };
in
{
  # home.file.".ghci".source = ./.ghci;

  # home.packages = [
  #   h.ghc
  #   htools
  #   hpkgs.hpack
  #   hpkgs.bindings-libzip
  #   hpkgs.bzlib
  #   hpkgs.bzlib-conduit
  #   hpkgs.bzip2-clib
  #   pkgs.haskellPackages.cabal-fmt
  #   pkgs.pkg-config
  #   pkgs.zlib
  #   pkgs.zlib.dev
  #   pkgs.bzip2
  #   pkgs.bzip2.dev
  #   pkgs.libzip
  #   # hpkgs.ghcprofview
  # ];
}
