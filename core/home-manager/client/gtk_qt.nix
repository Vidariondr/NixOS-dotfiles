{pkgs, ...}: {
  # GTK Themes
  gtk = {
    enable = true;
    cursorTheme = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
  };

  # QT Themes
  qt = {
    enable = true;
    style = {
      name = "Dracula";
      package = pkgs.dracula-qt5-theme;
    };
    # QT attempts to blend in with the look and feel of GTK-based DEs
    platformTheme.name = "gtk";
  };
}
