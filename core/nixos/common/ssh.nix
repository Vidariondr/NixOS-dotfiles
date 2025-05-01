{ config, ... }:
{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    ports = [ 2022 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
