{ config, ... }:
{
  home.sessionVariables = {
    VISUAL = "mousepad"; # Setting GUI text editor
    BROWSER = "floorp"; # Setting browser
    TERMINAL = "kitty"; # Setting terminal
    
    XDG_RUNTIME_DIR = "/run/user/$(id -u)"; # Required for thunar showing default apps

    GDK_BACKEND = "wayland"; # Setting the GDK backend

    GTK_THEME = "Dracula"; # Setting the GTK theme
  };
}
