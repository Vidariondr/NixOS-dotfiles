{...}: {
  imports = [
    ./audio.nix
    ./easyeffects.nix
    ./networking-localsend.nix
    ./networking-server-domain.nix
    ./office.nix
    ./ozone.nix
    ./packages.nix
    ./portals.nix
    ./sddm.nix
    ./thunar.nix
    ./wayfire.nix
    ../../../optional/nixos/steam
  ];
}
