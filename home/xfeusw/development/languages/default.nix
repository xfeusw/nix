# home/xfeusw/development/languages/default.nix
{ ... }:
{
  imports = [
    ./rust.nix
    ./nodejs.nix
    # ./python.nix
    ./nix.nix
    ./haskell.nix
    # ./java-scala.nix
  ];
}
