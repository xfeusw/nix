# home/xfeusw/git.nix
# { config, pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "khamrakulovkamron@gmail.com";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      color.ui = "auto";
      pull.rebase = true;
      push.default = "simple";
      merge.conflictStyle = "diff3";
      rerere.enabled = true;
    };
  };
}
