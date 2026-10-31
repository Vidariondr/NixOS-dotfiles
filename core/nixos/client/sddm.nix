{
  config,
  pkgs,
  ...
}: {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.settings = {
    Autologin = {
      Session = "umbriel";
      User = "jakub";
    };
  };
}
