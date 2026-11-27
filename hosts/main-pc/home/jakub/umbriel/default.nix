{config, ...}: {
  xdg.configFile."umbriel/config.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/hosts/main-pc/home/jakub/umbriel/config.toml";
}
