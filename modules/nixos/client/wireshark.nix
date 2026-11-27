{pkgs, ...}:
{
  programs.wireshark.enable = true;
  programs.wireshark.dumpcap.enable = true;
  environment.systemPackages = with pkgs; [wireshark];
  users.users.jakub.extraGroups = ["wireshark"];
}
