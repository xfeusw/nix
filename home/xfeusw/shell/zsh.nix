{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # History configuration
    history = {
      size = 10000;
      save = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    # Enhanced aliases
    shellAliases = {
      # Modern CLI tools
      ls = "eza --color=auto --icons";
      ll = "eza -la --color=auto --icons";
      la = "eza -la --color=auto --icons";
      tree = "eza --tree --icons";
      cat = "bat";
      find = "fd";
      grep = "rg";

      # System shortcuts
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # Git shortcuts
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";
      gd = "git diff";

      # NixOS management
      check = "nix flake check";
      sys-build = "sudo nixos-rebuild build --flake /home/xfeusw/.config/nix#acer";
      sys-update = "sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix#acer --upgrade";
      home-build = "home-manager build --flake /home/xfeusw/.config/nix#xfeusw";
      home-update = "home-manager switch --flake /home/xfeusw/.config/nix#xfeusw";

      # System monitoring
      top = "btop";
      df = "dust";
      ps = "procs";

      # Quick navigation
      config = "cd ~/.config";
      nix-config = "cd ~/.config/nix";
    };

    # Enhanced initialization
    initContent = ''
      # Initialize zoxide (smart cd)
      eval "$(zoxide init zsh)"

      # FZF integration
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # Custom functions
      mkcd() {
        mkdir -p "$1" && cd "$1"
      }

      # Quick system info
      sysinfo() {
        echo "System: $(uname -sr)"
        echo "Uptime: $(uptime -p)"
        echo "Memory: $(free -h | grep '^Mem:' | awk '{print $3 "/" $2}')"
        echo "Disk: $(df -h / | tail -1 | awk '{print $3 "/" $2 " (" $5 ")"}')"
      }

      # Extract any archive
      extract() {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "sudo"
        "history"
        "colored-man-pages"
        "command-not-found"
      ];
      # We'll use Starship instead of oh-my-zsh themes
      theme = "";
    };
  };
}
