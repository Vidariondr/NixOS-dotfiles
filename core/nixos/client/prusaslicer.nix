{lib, ...}:
{
  services.flatpak = {
    enable = true;
    remotes = lib.mkOptionDefault [{
      name = "flathub-beta"; location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    packages = [
      { appId = "com.prusa3d.PrusaSlicer"; origin = "flathub-beta";  }
    ];
    update.onActivation = true;
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
