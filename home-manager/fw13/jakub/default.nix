{...}: {
  imports = [
    ../../../core/home-manager/common
    ../../../core/home-manager/client
    ./git.nix
    ./niri
    ./umbriel
    ./packages.nix
    ./waybar.nix
  ];
}
