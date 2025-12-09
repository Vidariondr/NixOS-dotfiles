{pkgs, ...}: {
  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  services.swaync = {
    enable = true;
    settings = {
      "\$schema" = "${pkgs.swaynotificationcenter}/etc/xdg/swaync/configSchema.json";
      ignore-gtk-theme = true;
      positionX = "right";
      positionY = "bottom";
      layer = "overlay";
      layer-shell = true;
      cssPriority = "user";
      control-center-layer = "overlay";
      control-center-positionX = "right";
      control-center-positionY = "top";

      control-center-width = 350;
      control-center-height = 695;
      control-center-margin-top = 1;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;

      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-window-width = 300;
      notification-icon-size = 50;
      notification-body-image-height = 140;
      notification-body-image-width = 180;

      timeout = 6;
      timout-low = 3;
      timout-critical = 0;
      fit-to-screen = false;
      keyboard-shortucts = false;
      image-visibility = "when available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "notifications"
        "mpris"
        "volume"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = {
          text = " ";
        };
        label = {
          max-lines = 2;
          text = "Notifications";
        };
        mpris = {
          image-size = 60;
          image-radius = 10;
        };
        volume = {
          label = "󰕾 ";
        };
      };
    };
  };
}
