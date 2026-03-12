{config, ...}: {
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/home-manager/fw13/jakub/niri/config.kdl";
}
