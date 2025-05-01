{ config, ... }:
{
  programs.zsh = {
    shellGlobalAliases = {
      sshUbuntu = "kitten ssh jakub@192.168.0.15 -p 2022";
    };
  };
}
