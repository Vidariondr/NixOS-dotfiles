{config, ...}: {
  xdg.configFile."umbriel/config.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/home-manager/main-pc/jakub/umbriel/config.toml";
}
