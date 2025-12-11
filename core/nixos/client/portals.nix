{
  config,
  pkgs,
  ...
}: {
  services.dbus.packages = [pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.wlr = {
    enable = true;
    settings = {
      screencast = {
        output_name = "DP-1";
        max_fps = 30;
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
        chooser_type = "simple";
      };
    };
  };
}
