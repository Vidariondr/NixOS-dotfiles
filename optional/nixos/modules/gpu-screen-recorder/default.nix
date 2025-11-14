{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.services.gpu-screen-recorder;
in {
  options.services.gpu-screen-recorder = {
    enable = mkEnableOption "GPU Screen Recorder";

    replayMode = mkOption {
      type = types.bool;
      default = false;
      defaultText = "false";
      description = "Enables the gpu-screen-recorder in replay mode - systemd service.";
    };
  };

  config = mkIf cfg.enable {
    programs.gpu-screen-recorder.enable = true;

    systemd.user.services.gpu-screen-recorder = mkIf cfg.replayMode {
      description = "Enables the gpu-screen-recorder in replay mode - systemd service.";
      wantedBy = ["default.target"];

      serviceConfig = {
        EnvironmentFile = "/home/jakub/.config/gpu-screen-recorder.env";

        Environment = [
          "WINDOW=screen"
          "CONTAINER=mp4"
          "QUALITY=50000"
          "BITRATE_MODE=cbr"
          "CODEC=auto"
          "AUDIO_CODEC=opus"
          "AUDIO_DEVICE=default_output"
          "SECONDARY_AUDIO_DEVICE="
          "FRAMERATE=60"
          "REPLAYDURATION=60"
          "OUTPUTDIR=%h/Videos"
          "MAKEFOLDERS=no"
          "COLOR_RANGE=limited"
          "KEYINT=2"
          "ENCODER=gpu"
          "RESTORE_PORTAL_SESSION=yes"
          "OUTPUT_RESOLUTION=0x0"
          "ADDITIONAL_ARGS="
        ];

        KillSignal = "SIGINT";

        ExecStart = "${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder -v no -w $WINDOW -s $OUTPUT_RESOLUTION -c $CONTAINER -q $QUALITY -k $CODEC -ac $AUDIO_CODEC -a $AUDIO_DEVICE -a $SECONDARY_AUDIO_DEVICE -f $FRAMERATE -r $REPLAYDURATION -o $OUTPUTDIR -df $MAKEFOLDERS $ADDITIONAL_ARGS -cr $COLOR_RANGE -keyint $KEYINT -restore-portal-session $RESTORE_PORTAL_SESSION -encoder $ENCODER -bm $BITRATE_MODE";
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };
  };
}
