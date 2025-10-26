{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
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

  # Define hostname
  networking.hostName = "nixos_server";

  # DO NOT TOUCH THIS, EVEN AFTER UPGRADE, REINSTALL IS RECOMMENDED MORE THAN CHANGING THIS
  system.stateVersion = "24.11"; # Did you read the comment?
}
