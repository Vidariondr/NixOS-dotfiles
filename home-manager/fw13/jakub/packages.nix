{pkgs, ...}: {
  home.packages = [
    pkgs.wineWowPackages.stable
    pkgs.winetricks
    pkgs.lutris
    pkgs.jellyfin-media-player
    pkgs.swaylock
  ];

  services.blueman-applet.enable = true;
}
