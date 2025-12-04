{pkgs, ...}: {
  config = {
    home = {
      packages = with pkgs; [
        go
        gopls
        gotools
        go-tools
      ];
    };
  };
}
