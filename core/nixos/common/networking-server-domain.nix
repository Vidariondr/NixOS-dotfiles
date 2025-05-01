{ config, ... }:
{
  networking.networkmanager.insertNameservers = [ "192.168.0.15" ];
  networking.extraHosts = 
    ''
      192.168.0.15 homepage
    '';
}
