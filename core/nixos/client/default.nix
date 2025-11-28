{...}: {
  imports = [
    ./audio.nix
    ./easyeffects.nix
    ./nemo.nix
    ./networking-localsend.nix
    ./networking-server-domain.nix
    ./office.nix
    ./ozone.nix
    ./packages.nix
    ./portals.nix
    ./sddm.nix
    ./wayfire.nix
    ../../../optional/nixos/steam
  ];
}
