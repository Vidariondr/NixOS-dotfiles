{...}: {
  networking.firewall = {
    allowedUDPPorts = [51821];
    allowedTCPPorts = [8888];
    extraCommands = ''
      iptables -t nat -A POSTROUTING -s 10.11.12.1/24 -o wlp1s0 -j MASQUERADE
      iptables -I FORWARD 1 -i wg0 -o wlp1s0 -j ACCEPT
      iptables -I FORWARD 1 -i wlp1s0 -o wg0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    '';
  };
}
