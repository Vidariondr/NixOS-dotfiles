{config, ...}: {
  xdg.configFile."umbriel/config.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/hosts/fw13/home/jakub/umbriel/config.toml";
}
