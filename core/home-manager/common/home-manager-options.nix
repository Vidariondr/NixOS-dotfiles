{ config, ... }:
{
  home.sessionVariables = {
    EDITOR = "vim"; # Setting text editor
  };
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jakub";
  home.homeDirectory = "/home/jakub";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
