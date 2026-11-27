{umbriel,...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/client
    ../../modules/nixos/optional/qemu
    ../../modules/nixos/optional/secureboot
    umbriel.nixosModules.default
    ./home/default.nix
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  programs.dconf.enable = true;

  # BIOS updates
  services.fwupd.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Define hostname
  networking.hostName = "fw13";

  # DO NOT TOUCH THIS, EVEN AFTER UPGRADE, REINSTALL IS RECOMMENDED MORE THAN CHANGING THIS
  system.stateVersion = "24.11";
}
