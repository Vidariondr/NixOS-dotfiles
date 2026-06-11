{pkgs, ...}: {
  home.packages = [
    pkgs.wineWow64Packages.stable
    pkgs.winetricks
    pkgs.lutris
    pkgs.jellyfin-media-player
    pkgs.swaylock
  ];

  services.blueman-applet.enable = true;
}
