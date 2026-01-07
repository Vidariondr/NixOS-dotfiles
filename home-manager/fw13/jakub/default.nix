{...}: {
  imports = [
    ../../../core/home-manager/common
    ../../../core/home-manager/client
    ./git.nix
    ./packages.nix
    ./waybar.nix
    ./wayfire
  ];
}
