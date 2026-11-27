{pkgs, ...}: {
  home.packages = [
    pkgs.wineWow64Packages.stable
    pkgs.winetricks
    pkgs.lutris
    pkgs.jellyfin-media-player
    pkgs.swaylock
    pkgs.brightnessctl
  ];

  services.blueman-applet.enable = true;
}
