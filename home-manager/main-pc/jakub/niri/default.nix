{config, ...}: {
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/home-manager/main-pc/jakub/niri/config.kdl";
}
