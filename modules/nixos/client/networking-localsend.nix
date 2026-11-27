{config, ...}: {
  networking.firewall = {
    allowedTCPPorts = [53317 5500]; # 53317 is a LocalSend port
    allowedUDPPorts = [53317 5500]; # 53317 is a LocalSend port
  };
}
