{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    nemo-preview
    folder-color-switcher
  ];
  programs.xfconf.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
}
