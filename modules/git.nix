{ config, pkgs, ... }:

{
  # Install Git system-wide
  environment.systemPackages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "xfeusw";            # Change this if needed
    userEmail = "khamrakulovkamron@gmail.com";  # Change this to your real email

    # Sensible Git defaults
    extraConfig = {
      core.editor = "nano";                  # Change to "vim" or another editor
      init.defaultBranch = "main";           # Default branch name
      color.ui = "auto";                     # Colored output
      pull.rebase = true;                    # Rebase instead of merge when pulling
      push.default = "simple";               # Safer push behavior
      diff.tool = "meld";                    # Optional, change to your favorite diff tool
      merge.conflictStyle = "diff3";         # Better merge conflict info
      rerere.enabled = true;                 # Reuse recorded conflict resolutions
    };
  };
}
