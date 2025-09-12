# home/xfeusw/development/languages/java-scala.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Java
    jdk21
    maven
    gradle

    # Scala
    scala_3
    sbt

    # Language servers
    metals # Scala language server
  ];
}
