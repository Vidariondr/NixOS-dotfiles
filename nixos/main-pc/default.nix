{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../core/nixos/common
    ../../core/nixos/client
    ../../optional/nixos/steam
    ../../optional/nixos/qemu
    ../../optional/nixos/docker
  ];

  services.openssh = {
    knownHosts = {
      home-server = {
        extraHostNames = ["192.168.0.15"];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGBY2OaKF3WGMqZ7LYozacmhkBdWq8CPa7NCvYt5DlmD";
      };
    };
  };

  # Remove error messages from logs happening because of unused modules
  boot.blacklistedKernelModules = ["ucsi_ccg"];

  # Define hostname
  networking.hostName = "kuba_pc";

  # DO NOT TOUCH THIS, EVEN AFTER UPGRADE, REINSTALL IS RECOMMENDED MORE THAN CHANGING THIS
  system.stateVersion = "24.05";
}
