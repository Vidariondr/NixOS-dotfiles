{pkgs, ...}: {
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
    pkgs.floorp
    # Music player
    pkgs.feishin
    # Audio control
    pkgs.pavucontrol
    # App launcher
    pkgs.rofi-wayland
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
    # Notes app
    pkgs.siyuan
  ];
}
