{pkgs, ...}: {
  programs.zsh.initContent = ''
    # --- Environment Variables ---
    export EDITOR='hx'
    export VISUAL='hx'
    export PAGER='less'
    export MANPAGER='hx +Man!'

    # Performance: skip global compinit if you rely on the completionInit block in the main config
    skip_global_compinit=1

    # Initialize zoxide (fast directory switcher)
    eval "$(zoxide init zsh)"

    # FZF configuration
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview="bat --color=always --style=header,grid --line-range :300 {}"'

    # Source FZF key bindings and completion
    source ${pkgs.fzf}/share/fzf/key-bindings.zsh
    source ${pkgs.fzf}/share/fzf/completion.zsh

    # --- Custom Functions ---

    # Make directory and change into it
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
}
