{pkgs, ...}: {
  home.packages = [
    # Wine
    pkgs.wineWowPackages.stable
    pkgs.winetricks
    # 3D Printing
    pkgs.openscad
    # Movies/tv-show player
    pkgs.jellyfin-media-player
    # Arduino IDE
    pkgs.arduino-ide
    # Image editor
    pkgs.gimp3
  ];
}
