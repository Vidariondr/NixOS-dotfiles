{...}: {
  imports = [
    ../../../core/home-manager/common
    ../../../core/home-manager/client
    ./git.nix
    ./umbriel
    ./packages.nix
    ./waybar.nix
  ];
}
