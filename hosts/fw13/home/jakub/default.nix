{...}: {
  imports = [
    ../../../../modules/home-manager/common
    ../../../../modules/home-manager/client
    ./git.nix
    ./umbriel
    ./packages.nix
    ./waybar.nix
  ];
}
