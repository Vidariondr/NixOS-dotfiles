{
  description = "System flake";

  inputs = {
    affinity-nix.url = "github:mrshmllow/affinity-nix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
    nvf.url = "github:notashelf/nvf?ref=v26.07";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umbriel.url = "github:noctalia-dev/umbriel";
  };

  outputs = {
    affinity-nix,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nix-flatpak,
    nvf,
    lanzaboote,
    home-manager,
    umbriel,
    ...
  } @ inputs: {
    nixosConfigurations.kubapc = nixpkgs.lib.nixosSystem {
      # System variable indicating the system type
      system = "x86_64-linux";

      # Passing variables to other modules
      specialArgs = {inherit affinity-nix inputs nixpkgs-unstable umbriel nvf;};

      modules = [
        nix-flatpak.nixosModules.nix-flatpak

        # Main configuration.nix module (also wires in its home-manager config)
        ./hosts/main-pc
      ];
    };

    nixosConfigurations.fw13 = nixpkgs.lib.nixosSystem {
      # System variable indicating the system type
      system = "x86_64-linux";

      # Passing variables to other modules
      specialArgs = {inherit inputs nixpkgs-unstable umbriel nvf;};

      modules = [
        nix-flatpak.nixosModules.nix-flatpak

        # Main configuration.nix module (also wires in its home-manager config)
        ./hosts/fw13

        # Framework specific hardware configuration
        nixos-hardware.nixosModules.framework-13-7040-amd
      ];
    };

    nixosConfigurations.nixosserver = nixpkgs.lib.nixosSystem {
      # System variable indicating the system type
      system = "x86_64-linux";

      # Passing variables to other modules
      specialArgs = {inherit inputs nixpkgs-unstable nvf;};

      modules = [
        # Main configuration.nix module (also wires in its home-manager config)
        ./hosts/nixos-server
      ];
    };
  };
}
