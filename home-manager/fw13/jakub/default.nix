{...}: {
  imports = [
    ../../../core/home-manager/common
    ../../../core/home-manager/client
    ./packages.nix
    ./waybar.nix
    ./wayfire
  ];
}
