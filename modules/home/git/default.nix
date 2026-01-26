{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "xfeusw";
        email = "khamrakulovkamron@gmail.com";
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
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
  home.activation = {
    setupGhToken = config.lib.dag.entryAfter ["writeBoundary"] ''
          mkdir -p $HOME/.config/gh

          # System-wide secrets are always at /run/secrets/<name>
          if [ -f /run/secrets/gh_token ]; then
            cat > $HOME/.config/gh/hosts.yml <<EOF
      github.com:
          user: khamrakulov
          oauth_token: $(cat /run/secrets/gh_token)
          git_protocol: ssh
      EOF
            chmod 600 $HOME/.config/gh/hosts.yml
          fi
    '';
  };
}
