{pkgs, ...}: {
  # Enables UI settings saving for virt-manager
  programs.dconf.enable = true;

  # Allows to manage virtual machines without sudo
  users.users.jakub.extraGroups = ["libvirtd"];

  # This enables to create and manage VMs
  virtualisation.libvirtd.enable = true;
  # Enables UEFI instead of BIOS in the VMs
  virtualisation.libvirtd.qemu.ovmf.enable = true;

  environment.systemPackages = with pkgs; [
    qemu
    virt-manager # Optional GUI for managing VMs
    virt-viewer # Optional for graphical output
  ];
}
