{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../core/nixos/common
    ../../core/nixos/client
    ../../optional/nixos/qemu
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  programs.dconf.enable = true;

  networking.firewall.checkReversePath = "loose";

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
