{...}: let
  font = "JetBriansMono Nerd Font";
in {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      background_opacity = "0.7";
      window_padding_width = 4;

      foreground = "#f8f8f2";
      background = "#282a36";
      selection_foreground = "#ffffff";
      selection_background = "#44475a";

      # Cursor colors
      cursor = "#f8f8f2";
      cursor_text_color = "#282a36";

      # Black
      color0 = "#21222c";
      color8 = "#6272a4";

      # Red
      color1 = "#ff5555";
      color9 = "#ff6e6e";

      # Green
      color2 = "#50fa7b";
      color10 = "#69ff94";

      # Yellow
      color3 = "#f1fa8c";
      color11 = "#ffffa5";

      # Blue
      color4 = "#bd93f9";
      color12 = "#d6acff";

      # Magenta
      color5 = "#ff79c6";
      color13 = "#ff92df";

      # Cyan
      color6 = "#8be9fd";
      color14 = "#a4ffff";

      # White
      color7 = "#f8f8f2";
      color15 = "#ffffff";

      # Tab bar colors
      active_tab_foreground = "#282a36";
      active_tab_background = "#f8f8f2";
      inactive_tab_foreground = "#282a36";
      inactive_tab_background = "#6272a4";

      # Marks
      mark1_foreground = "#282a36";
      mark1_background = "#ff5555";

      # Splits/Windows
      active_border_color = "#f8f8f2";
      inactive_border_color = "#6272a4";
    };
    font = {
      size = 11;
      name = font;
    };
  };
}
