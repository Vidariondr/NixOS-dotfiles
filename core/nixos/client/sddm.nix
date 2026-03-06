{
  config,
  pkgs,
  ...
}: {
  services.displayManager.defaultSession = "niri";
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.settings.Wayland.SessionDir = "${pkgs.niri}/share/wayland-sessions";
  services.displayManager.sddm.settings = {
    Autologin = {
      Session = "niri";
      User = "jakub";
    };
  };
}
