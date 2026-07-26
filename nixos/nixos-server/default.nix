{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./wgportal.nix
    ../../core/nixos/common
    ../../optional/nixos/docker
  ];

  systemd.timers."kopia-backup" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "*-*-* 03:00:00";
      Persistent = true;
      Unit = "kopia-backup.service";
    };
  };

  systemd.services."kopia-backup" = {
    script = ''
      ${pkgs.kopia}/bin/kopia snapshot create --all
      ${pkgs.kopia}/bin/kopia snapshot verify --verify-files-percent=1 --file-parallelism=10 --parallel=10
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  systemd.timers."kopia-estimate" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "*-*-* 21:30:00";
      Persistent = true;
      Unit = "kopia-estimate.service";
    };
  };

  systemd.services."kopia-estimate" = {
    path = with pkgs; [bash kopia curl bash busybox];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "/home/jakub/docker/scripts/kopia-estimate.sh";
    };
  };

  systemd.services."update-gluetun-ip" = {
    path = with pkgs; [bash coreutils gnused gnugrep glibc getent docker];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "/home/jakub/docker/scripts/update-gluetun-ip.sh";
    };
  };

  systemd.timers."update-gluetun-ip" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "1min";
      OnUnitActiveSec = "5min";
      Persistent = true;
      Unit = "update-gluetun-ip.service";
    };
  };

  # Define hostname
  networking.hostName = "nixos_server";

  # DO NOT TOUCH THIS, EVEN AFTER UPGRADE, REINSTALL IS RECOMMENDED MORE THAN CHANGING THIS
  system.stateVersion = "24.11"; # Did you read the comment?
}
