{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar-mpris
    font-awesome
  ];

  fonts.fontconfig.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;
        height = 25;
        modules-left = ["systemd-failed-units" "mpris"];
        modules-center = ["wlr/taskbar"];
        modules-right = [
          "tray"
          "cpu"
          "memory"
          "temperature#cpu"
          "temperature#gpu"
          "wireplumber"
          "clock"
          "custom/notification"
        ];

        "systemd-failed-units" = {
          format = "✗ {nr_failed}";
          format-ok = "✓";
          user = false;
          system = true;
          hide-on-ok = false;
        };

        "mpris" = {
          format-playing = "{player_icon} {dynamic}";
          format-paused = "{status_icon} {dynamic}";
          format-stopped = "Nothing playing...";
          dynamic-len = 30;
          interval = 1;
          player-icons = {
            default = "⏸";
          };
          status-icons = {
            paused = "▶";
          };
          tooltip = false;
        };

        "wlr/taskbar" = {
          tooltip = true;
          on-click = "minimize-raise";
        };

        tray = {spacing = 16;};

        "cpu" = {
          format = " {usage}%";
          tooltip = false;
          on-click = "kitty btop";
        };

        "memory" = {
          format = " {}%";
          on-click = "kitty btop";
        };

        "temperature#cpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          format = "{icon} {temperatureC}°C";
          format-icons = ["" ""];
          tooltip = false;
          on-click = "kitty btop";
        };

        "temperature#gpu" = {
          hwmon-path = "/sys/class/drm/card1/device/hwmon/hwmon0/temp1_input";
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
          tooltip = false;
          on-click = "kitty nvtop";
        };

        clock = {
          format = "󰥔  {:%I:%M %p}";
          format-alt = "  {:%a, %d %b %Y}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
          };
          actions = {
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
            on-click-right = "shift_reset";
          };
        };

        wireplumber = {
          format = "󰕾 {volume}%";
          format-muted = "󰝟 0%";
          tooltip = false;
          on-click = "pavucontrol";
          on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 45%";
          scroll-step = 1;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{} {icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "JetBrains Mono", "Font Awesome 6 Free";
        color: #EAF0F5;
        font-weight: 700;
      }

      window#waybar {
        background-color: #0B0B0B;
        transition-property: background-color;
        transition-duration: 0.5s;
        border-radius: 0px;
        font-size: 12px;
      }

      .modules-left, .modules-center, .modules-right {
        border-radius: 0px;
        background-color: #0B0B0B;
        padding: 0px 2px;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #window > * {
        font-family: "JetBrains Mono";
      }

      #wireplumber,
      #systemd-failed-units,
      #mpris,
      #taskbar,
      #cpu,
      #temperature.cpu,
      #temperature.gpu,
      #memory,
      #clock,
      #custom-notification,
      #tray {
        border-radius: 0px;
        margin: 0px 0px;
        padding: 0px 12px;
        background-color: #0B0B0B;
        color: #EAF0F5;
      }

      #tray menu {
        background-color: #121212;
        color: #EAF0F5;
      }

      tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: #121212;
        color: #EAF0F5;
      }

      tooltip label {
        padding: 5px;
        background-color: #121212;
        color: #EAF0F5;
      }
    '';
  };
}
