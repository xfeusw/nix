# home/xfeusw/git.nix
{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "khamrakulovkamron@gmail.com";

    extraConfig = {
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      init.defaultBranch = "main";
      color.ui = "auto";
      pull.rebase = true;
      push.default = "simple";
      merge.conflictStyle = "diff3";
      rerere.enabled = true;

      # Better diffs
      diff.tool = "vimdiff";
      merge.tool = "vimdiff";

      # Signing commits (optional)
      # commit.gpgsign = true;
      # user.signingkey = "your-gpg-key";
    };

    aliases = {
      st = "status -s";
      co = "checkout";
      br = "branch";
      ci = "commit";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "!gitk";
      lg = "log --oneline --graph --decorate --all";
      wip = "commit -am 'WIP'";
      unwip = "reset HEAD~1";
    };
  };

  # Git-related tools
  home.packages = with pkgs; [
    gh # GitHub CLI
    git-lfs # Large file support
    lazygit # Terminal Git UI
    gitui # Another Git TUI
  ];
}
