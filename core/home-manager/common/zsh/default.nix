{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    pure-prompt
  ];

  programs.zsh = {
    enable = true;

    # Where the config files will be located
    dotDir = ".config/zsh";

    # Autosuggestions as you type/predictive typing
    autosuggestion = {
      enable = true;
      highlight = "fg=#878787";
    };

    history = {
      size = 1000; # How many commands to keep in memory during a session
      save = 1000; # How many commands to keep in history file
      path = "/home/jakub/NixOS-dotfiles/core/home-manager/common/zsh/zsh_history";
      ignoreAllDups = true; # Doesnt add command if it was entered before
    };

    # Enables ability to type and then use arrows to find previous command
    historySubstringSearch = {
      enable = true;
      searchDownKey = "$terminfo[kcud1]";
      searchUpKey = "$terminfo[kcuu1]";
    };

    syntaxHighlighting = {
      enable = true;
    };

    # Autoloads completion
    completionInit = "autoload -Uz compinit; compinit; _comp_options+=(globdots)";
    enableCompletion = true;

    # Allows terminals to track the current working dir
    enableVteIntegration = true;

    shellGlobalAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };

    # First three lines load the pure-prompt
    # 1. Menu selection for completions
    # 2. Allow gaining privileges in completion
    # 3. Fuzzy matching for any part of the file name
    initContent = lib.mkBefore ''
      fpath=("${pkgs.pure-prompt}/share/zsh/site-functions")
      autoload -Uz promptinit; promptinit
      prompt pure
      zstyle ':completion:*' menu select
      zstyle ':completion::complete:*' gain-privileges 1
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=*'
    '';
  };
}
