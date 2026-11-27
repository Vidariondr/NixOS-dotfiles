{
  config,
  lib,
  ...
}: {
  home.sessionVariables = {
    VISUAL = lib.mkForce "mousepad"; # Setting GUI text editor
    BROWSER = "floorp"; # Setting browser
    TERMINAL = "kitty"; # Setting terminal

    GDK_BACKEND = "wayland"; # Setting the GDK backend

    GTK_THEME = "Dracula"; # Setting the GTK theme
  };
}
