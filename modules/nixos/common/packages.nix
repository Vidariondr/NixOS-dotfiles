{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    ncdu
    exfatprogs
    edk2-uefi-shell
    btop
    nvtopPackages.amd
    ffmpeg
    wireguard-tools
  ];
}
