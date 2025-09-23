# home/xfeusw/shell/zsh.nix
{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 50000;
      save = 50000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
    };

    shellAliases = {
      # Modern CLI tools
      ls = "eza --color=auto --icons --group-directories-first";
      ll = "eza -la --color=auto --icons --group-directories-first";
      la = "eza -la --color=auto --icons --group-directories-first";
      tree = "eza --tree --icons";
      cat = "bat --paging=never";
      grep = "rg";
      find = "fd";
      du = "dust";
      df = "dust";
      top = "btop";
      ps = "procs";

      # Git shortcuts
      g = "git";
      gs = "git status -sb";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gd = "git diff";
      gdc = "git diff --cached";
      gl = "git log --oneline --graph --decorate";
      gla = "git log --oneline --graph --decorate --all";

      # NixOS management
      check = "nix flake check";
      sys-build = "sudo nixos-rebuild build --flake /home/xfeusw/.config/nix#acer --option restrict-eval false";
      sys-switch = "sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix#acer --option restrict-eval false";
      sys-update = "sudo nixos-rebuild switch --flake /home/xfeusw/.config/nix#acer --upgrade --option restrict-eval false";
      home-build = "home-manager build --flake /home/xfeusw/.config/nix#xfeusw --option restrict-eval false";
      home-switch = "home-manager switch --flake /home/xfeusw/.config/nix#xfeusw --option restrict-eval false";
      home-update = "home-manager switch --flake /home/xfeusw/.config/nix#xfeusw --option restrict-eval false";
      nix-clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d && home-manager expire-generations 0 && sudo nix-store --optimise";
      nix-search = "nix search nixpkgs";

      # Development shortcuts
      dev = "nix develop";
      run = "nix run";
      shell = "nix shell";

      # System shortcuts
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # Quick navigation
      config = "cd ~/.config";
      nix-config = "cd ~/.config/nix";

      # Docker/Podman
      docker = "podman";

      # System info
      temp = "sensors";
      ports = "ss -tuln";

      # Project dumping
      dump = "dump-project";
      dump-project = "dump-project";
      dump-code = "dump-project";
      project-dump = "dump-project";
    };

    initContent = ''
      # Performance: only load what's needed
      skip_global_compinit=1
      # Initialize tools
      eval "$(zoxide init zsh)"
      eval "$(direnv hook zsh)"

      # FZF configuration
      export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
      export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview="bat --color=always --style=header,grid --line-range :300 {}"'

      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # Custom functions
      mkcd() { mkdir -p "$1" && cd "$1" }

      # Quick system info
      sysinfo() {
        echo "System: $(uname -sr)"
        echo "Host: $(hostname)"
        echo "Uptime: $(uptime -p)"
        echo "Memory: $(free -h | grep '^Mem:' | awk '{print $3 "/" $2}')"
        echo "Disk: $(df -h / | tail -1 | awk '{print $3 "/" $2 " (" $5 ")"}')"
        echo "CPU: $(lscpu | grep 'Model name' | sed 's/Model name: *//')"
        if command -v sensors >/dev/null 2>&1; then
          echo "Temp: $(sensors | grep 'Core 0' | awk '{print $3}' | head -1)"
        fi
      }

      # Extract any archive
      extract() {
        if [[ -f $1 ]]; then
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
            *.xz)        unxz $1        ;;
            *.lzma)      unlzma $1      ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }

      # Nix helpers
      nix-which() { readlink -f $(which $1) }
      nix-locate() { nix-index --locate "$1" }

      # Git helpers
      git-clean-branches() {
        git branch --merged | grep -v "\*\|main\|master\|develop" | xargs -r git branch -d
      }

      # Performance monitoring
      mem-top() { ps aux --sort=-%mem | head }
      cpu-top() { ps aux --sort=-%cpu | head }

      # Network helpers
      myip() { curl -s ifconfig.me && echo }
      ports() { ss -tuln }
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
        "extract"
        "z"
        "direnv"
      ];
      theme = ""; # Using Starship instead
    };
  };
}
