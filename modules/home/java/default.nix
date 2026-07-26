{pkgs, ...}:

{
  programs.java = {
    enable = true;
    package = pkgs.openjdk25;
  };

  home.packages = with pkgs; [
    jdt-language-server
    lombok
  ];
}
