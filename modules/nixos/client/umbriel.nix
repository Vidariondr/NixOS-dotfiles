{pkgs, ...}: {
  programs.umbriel.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.extraInit = ''
    if [ -z "$SSH_AUTH_SOCK" ] && [ -n "$XDG_RUNTIME_DIR" ]; then
      export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
    fi
  '';
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    lxqt.lxqt-policykit
    xwayland
  ];
}
