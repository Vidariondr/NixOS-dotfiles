{pkgs, ...}: {
  home.packages = [
    # Wine
    pkgs.wineWowPackages.stable
    pkgs.winetricks
    pkgs.lutris
    # Discord client
    pkgs.vesktop
    # Movies/tv-show player
    pkgs.jellyfin-media-player
    pkgs.brightnessctl
    pkgs.swaylock
    pkgs.swayidle
  ];

  services.blueman-applet.enable = true;
}
