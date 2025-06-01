{config, ...}: {
  # Sound effects
  xdg.configFile."easyeffects".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/core/home-manager/client/easyeffects";

  # App Launcher
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/core/home-manager/client/rofi";

  # Shutdown / Restart UI
  xdg.configFile."nwg-bar".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/core/home-manager/client/nwg-bar";
}
