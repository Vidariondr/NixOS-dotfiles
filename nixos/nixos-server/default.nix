{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../core/nixos/common
    ../../optional/nixos/docker
  ];

  # Define hostname
  networking.hostName = "nixos_server";

  # DO NOT TOUCH THIS, EVEN AFTER UPGRADE, REINSTALL IS RECOMMENDED MORE THAN CHANGING THIS
  system.stateVersion = "24.11"; # Did you read the comment?
}
