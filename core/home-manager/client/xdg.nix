{ config, ... }:
{
  # Setting the XDG 
  xdg = {
    enable = true;
 
    # Setting user directories like Downloads, Music, etc...
    userDirs = {
     enable = true;
     createDirectories = true;
     download = "${config.home.homeDirectory}/Downloads";
    };

    # Enable default apps management
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "floorp.desktop" ];
        "text/plain" = [ "org.xfce.mousepad.desktop" ];
        "model/stl"= [ "org.freecadweb.FreeCAD.desktop" ];
        "image/jpeg " =  [ "org.nomacs.ImageLounge.desktop" ];
        "image/png " =  [ "org.nomacs.ImageLounge.desktop" ];
      };
    };
  };
}
