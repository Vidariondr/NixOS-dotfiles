{...}: {
  imports = [
    ../../../core/home-manager/common
    ../../../core/home-manager/client
    ./git.nix
    ./niri
    ./packages.nix
    ./waybar.nix
  ];
}
