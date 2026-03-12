{pkgs, ...}: {
  services.dbus.packages = [pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.wlr = {
    enable = true;
  };
}
