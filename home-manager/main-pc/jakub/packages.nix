{pkgs, ...}: {
  home.packages = [
    # Wine
    pkgs.wineWowPackages.stable
    pkgs.winetricks
    # 3D Printing
    pkgs.openscad
    # Discord client
    pkgs.vesktop
    # Movies/tv-show player
    pkgs.jellyfin-media-player
    # 3D CAD
    pkgs.freecad
    # Arduino IDE
    pkgs.arduino-ide
    # 3D Slicer
    pkgs.orca-slicer
  ];
}
