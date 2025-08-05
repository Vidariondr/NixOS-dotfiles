{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libnotify
    lxqt.lxqt-policykit # Policy kit. Enables permissions GUI popups
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
