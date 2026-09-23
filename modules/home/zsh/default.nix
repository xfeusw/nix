{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
      {
        name = "zsh-abbr";
        src = pkgs.zsh-abbr;
      }
      {
        name = "zsh-navigation-tools";
        src = pkgs.zsh-navigation-tools;
      }
      {
        name = "zsh-bd";
        src = pkgs.zsh-bd;
      }
    ];

    autocd = true;

    initContent = ''
      setopt AUTO_CD
      setopt CORRECT
      setopt INTERACTIVE_COMMENTS
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
