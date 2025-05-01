{ config, ... }:
{
  users.users.jakub = {
    isNormalUser = true;
    extraGroups = [ "wheel" "dialout" "docker" ];
  };
}
