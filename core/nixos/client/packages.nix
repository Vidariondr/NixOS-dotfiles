{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit # Policy kit. Enables permissions GUI popups
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
