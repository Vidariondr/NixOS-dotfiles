{config, ...}: {
  xdg.configFile."umbriel/config.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/home-manager/fw13/jakub/umbriel/config.toml";
}
