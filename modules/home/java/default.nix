{pkgs, ...}: {
  home.packages = with pkgs; [
    jdt-language-server
    jdk25
    clang-tools
  ];
}
