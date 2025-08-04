{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget # Tool for downloading files using HTTP, HTTPS, and FTP
    ncdu # CLI file manager
    exfatprogs # exFAT utilities. Needed for formatting drives
    edk2-uefi-shell # Tool used for secureboot with dualboot
    btop # Task manager
    nvtopPackages.amd # GPU utilization
    ffmpeg # Video framework
    wireguard-tools # Tools for the WireGuard secure network tunnel
  ];
}
