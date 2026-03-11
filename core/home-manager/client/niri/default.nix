{config, ...}: {
  xdg.configFile."niri/common.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/core/home-manager/client/niri/common.kdl";
}
