# home/xfeusw/zsh.nix
{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      check = "nix flake check";
      sys-build = "sudo nixos-rebuild build --flake /hoem/xfeusw/.config/nix";
      sys-update = "sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix";
      home-build = "home-manager build --flake /home/xfeusw/.config/nix";
      home-update = "home-manager switch --flake /home/xfeusw/.config/nix";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
      ];
      theme = "robbyrussell";
    };
  };
}
