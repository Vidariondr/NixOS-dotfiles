{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })    
    fira-code
    jetbrains-mono
  ];
}
