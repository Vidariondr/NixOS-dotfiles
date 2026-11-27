{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = [
    pkgs.wl-clipboard
    pkgs.veracrypt
    pkgs.element-desktop
    pkgs.file-roller
    pkgs.mpv
    pkgs.floorp-bin
    pkgs.pavucontrol
    pkgs.rofi
    pkgs.mousepad
    pkgs.playerctl
    pkgs.nwg-bar
    pkgs.localsend
    pkgs.nomacs
    pkgs.blender
    pkgs.vscodium-fhs
    pkgs.orca-slicer
    pkgs-unstable.prusa-slicer
    pkgs.freecad
    pkgs.networkmanagerapplet
    pkgs.vesktop
    pkgs.anydesk
    pkgs.gnome-disk-utility
    pkgs.swaybg
    pkgs.dracula-qt5-theme
    pkgs.dracula-icon-theme
    pkgs.dracula-theme
    pkgs.darktable
    pkgs.gphoto2
    pkgs.feishin
    pkgs.rustdesk-flutter
    pkgs.grim
    pkgs.slurp
    pkgs.cursor-clip
  ];
  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
    };
  };
}
