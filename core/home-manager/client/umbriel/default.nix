{config, ...}: {
  xdg.configFile."umbriel/common.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/core/home-manager/client/umbriel/common.toml";
}
