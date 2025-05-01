{ config, pkgs, ... }:
{
  services.displayManager.defaultSession = "wayfire";
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.settings.Wayland.SessionDir = "${pkgs.wayfire}/share/wayland-sessions";
  services.displayManager.sddm.settings = {
    Autologin = {
      Session = "wayfire";
      User = "jakub";
    };
  };
}
