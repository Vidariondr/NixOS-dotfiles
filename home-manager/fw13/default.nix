{
  nixpkgs-unstable,
  nixpkgs-2405,
  nvf,
  inputs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager.extraSpecialArgs = let
    pkgs-config = {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    inherit inputs;
    pkgs-unstable = import nixpkgs-unstable pkgs-config;
    pkgs-2405 = import nixpkgs-2405 pkgs-config;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jakub = {
    imports = [./jakub/default.nix nvf.homeManagerModules.default];
  };
}
