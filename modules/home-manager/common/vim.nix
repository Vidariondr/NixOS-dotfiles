{ config, ... }: 
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      number = true;
      ignorecase = true;
    };
    extraConfig = ''
      set hlsearch
      set incsearch
      set ruler
      set nocompatible
      set showcmd
      set wildmenu
      filetype plugin indent on
    '';
  };
}
