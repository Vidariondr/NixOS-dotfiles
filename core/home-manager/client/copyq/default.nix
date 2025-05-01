{config, ...}: {
  services = {
    copyq = {
      enable = true;
    };
  };
  xdg.configFile."copyq/copyq.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/core/home-manager/client/copyq/copyq.conf";
}
