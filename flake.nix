{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nvf.url = "github:notashelf/nvf";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nvf,
    lanzaboote,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.kubapc = nixpkgs.lib.nixosSystem {
      # System variable indicating the system type
      system = "x86_64-linux";

      # Passing variables to other modules
      specialArgs = {inherit inputs nixpkgs-unstable nvf;};

      modules = [
        # Main configuration.nix module
        ./nixos/main-pc/default.nix

        # Secure boot module
        ./optional/nixos/secureboot

        # Home-manager module
        ./home-manager/main-pc
      ];
    };

    nixosConfigurations.fw13 = nixpkgs.lib.nixosSystem {
      # System variable indicating the system type
      system = "x86_64-linux";

      # Passing variables to other modules
      specialArgs = {inherit inputs nixpkgs-unstable nvf;};

      modules = [
        # Main configuration.nix module
        ./nixos/fw13

        # Framework specific hardware configuration
        nixos-hardware.nixosModules.framework-13-7040-amd

        # Home-manager module
        ./home-manager/fw13
      ];
    };

    nixosConfigurations.nixosserver = nixpkgs.lib.nixosSystem {
      # System variable indicating the system type
      system = "x86_64-linux";

      # Passing variables to other modules
      specialArgs = {inherit inputs nixpkgs-unstable nvf;};

      modules = [
        # Main configuration.nix module
        ./nixos/nixos-server

        # Home-manager module
        ./home-manager/nixos-server
      ];
    };
  };
}
