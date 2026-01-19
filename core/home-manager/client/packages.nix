{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = [
    # Wayland clipboard support
    pkgs.wl-clipboard
    # Screenshot tools grim and slurp
    pkgs.grim
    pkgs.slurp
    # Encryption, backup bitwarden and raivo
    pkgs.veracrypt
    # Matrix client
    pkgs.element-desktop
    # Archive manager
    pkgs.file-roller
    # Video player
    pkgs.mpv
    # Firefox-based browser
    pkgs.floorp-bin
    # Audio control
    pkgs.pavucontrol
    # App launcher
    pkgs.rofi
    # GUI text editor
    pkgs.xfce.mousepad
    # CLI utility for controlling media players that implement MPRIS
    pkgs.playerctl
    # Restart/shutdown app
    pkgs.nwg-bar
    # Locally send files to over devices
    pkgs.localsend
    # Image viewer
    pkgs.nomacs
    # 3D modelling
    pkgs.blender
    # Code editor
    pkgs.vscodium-fhs
    # 3D Slicer
    pkgs.orca-slicer
    # 3D Slicer
    pkgs-unstable.prusa-slicer
    # 3D CAD
    pkgs.freecad
    # NetworkManager GUI
    pkgs.networkmanagerapplet
    # Discord client
    pkgs.vesktop
    pkgs.anydesk # Remote access
    pkgs.gnome-disk-utility # Formatting disks
  ];
  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
    };
  };
}
