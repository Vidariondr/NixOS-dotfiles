{pkgs, ...}: {
  programs.umbriel.enable = true;
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
    lxqt.lxqt-policykit
    xwayland
  ];
}
