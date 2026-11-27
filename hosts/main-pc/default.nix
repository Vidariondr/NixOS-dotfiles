{
  affinity-nix,
  umbriel,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/client
    ../../modules/nixos/optional/qemu
    ../../modules/nixos/optional/docker
    ../../modules/nixos/optional/secureboot
    umbriel.nixosModules.default
    ./home/default.nix
  ];

  services.openssh = {
    knownHosts = {
      home-server = {
        extraHostNames = ["192.168.0.15"];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGBY2OaKF3WGMqZ7LYozacmhkBdWq8CPa7NCvYt5DlmD";
      };
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      msitools = prev.msitools.overrideAttrs (_: {doCheck = false;});
    })
    affinity-nix.overlays.default
  ];

  environment.systemPackages = [pkgs.affinity-v3 pkgs.claude-code];

  networking.networkmanager.insertNameservers = ["9.9.9.9" "1.1.1.1"];

  # Remove error messages from logs happening because of unused modules
  boot.blacklistedKernelModules = ["ucsi_ccg"];

  # Define hostname
  networking.hostName = "kuba_pc";

  # DO NOT TOUCH THIS, EVEN AFTER UPGRADE, REINSTALL IS RECOMMENDED MORE THAN CHANGING THIS
  system.stateVersion = "24.05";
}
