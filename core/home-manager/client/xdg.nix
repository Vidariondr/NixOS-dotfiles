{config, ...}: {
  # Setting the XDG
  xdg = {
    enable = true;

    # Setting user directories like Downloads, Music, etc...
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/Downloads";
    };
  };
}
