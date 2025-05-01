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
    pkgs.mpv # Video player
    pkgs.floorp # Firefox-based browser

    pkgs.feishin # Music player
    pkgs.pavucontrol # Audio control
    pkgs.rofi-wayland # App launcher
    pkgs.xfce.mousepad # GUI text editor
    pkgs.playerctl # CLI utility for controlling media players that implement MPRIS
    pkgs.nwg-bar # Restart/shutdown app
    pkgs.localsend # Locally send files to over devices
    pkgs.nomacs # Image viewer
  ];
}
