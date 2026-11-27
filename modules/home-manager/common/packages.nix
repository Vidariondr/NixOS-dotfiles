{pkgs, ...}: {
  home.packages = with pkgs; [
    killall
    sops
    tldr
    unzip
  ];
}
