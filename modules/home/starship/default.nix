{lib, ...}: {
  programs.starship = {
    enable = true;

    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$line_break"
        "$python"
        "$rust"
        "$nodejs"
        "$java"
        "$nix_shell"
        "$character"
      ];

      directory = {
        style = "blue";
        truncate_to_repo = false;
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
        min_time = 2000;
      };

      nix_shell = {
        format = "[$symbol$state( \($name\))]($style) ";
        symbol = "❄️ ";
        style = "bright-blue";
      };

      python = {
        format = "[$symbol$pyenv_prefix($version )(\($virtualenv\) )]($style)";
        style = "bright-black";
      };
    };
  };
}
