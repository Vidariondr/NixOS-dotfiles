{pkgs, ...}: {
  home.packages = [
    pkgs.wineWow64Packages.stable
    pkgs.winetricks
    pkgs.openscad
    pkgs.jellyfin-media-player
    pkgs.gimp3
    pkgs.audacity
    pkgs.prismlauncher
  ];
}
