{pkgs, ...}: {
  home.file.".config/wayfire.ini".text = ''
    # Input configuration ──────────────────────────────────────────────────────────

    [input]
    xkb_layout = us,pl,gb
    xkb_options = grp:win_space_toggle

    cursor_theme = phinger-cursors-dark

    # Output configuration ─────────────────────────────────────────────────────────

    [output:eDP-1]
    mode = 2256x1504@60000
    position = 0,0
    transform = normal
    scale = 1.500000

    # Core options ─────────────────────────────────────────────────────────────────

    [core]

    # List of plugins to be enabled.
    # See the Configuration document for a complete list.
    plugins = alpha animate autostart command decoration expo fast-switcher grid gtk-shell move oswitch place resize switcher vswitch wayfire-shell window-rules wm-actions zoom foreign-toplevel session-lock idle

    # Close focused window.
    close_top_view = <super> <shift> KEY_C | <alt> KEY_F4

    # Workspaces arranged into a grid: 3 × 3.
    vwidth = 3
    vheight = 3

    # Prefer client-side decoration or server-side decoration
    preferred_decoration_mode = client

    # Turn on X11 for other windows
    xwayland = true

    # Mouse bindings ───────────────────────────────────────────────────────────────

    # Drag windows by holding down Super and left mouse button.
    [move]
    activate = <super> BTN_LEFT
    snap_threshold = 50

    # Resize them with right mouse button + Super.
    [resize]
    activate = <super> BTN_RIGHT

    # Zoom in the desktop by scrolling + Super.
    [zoom]
    modifier = <super>

    # Change opacity by scrolling with Super + Alt.
    [alpha]
    modifier = <super> <alt>

    # Startup commands ─────────────────────────────────────────────────────────────

    [autostart]

    # Automatically start background and panel.
    # Set to false if you want to override the default clients.
    autostart_wf_shell = false
    background = wf-background

    # Output configuration
    # https://wayland.emersion.fr/kanshi/
    outputs = kanshi

    # Notifications
    notifications = swaync

    # Screen color temperature
    # https://sr.ht/~kennylevinsen/wlsunset/
    gamma = gammastep

    # XDG desktop portal
    # Needed by some GTK applications
    portal = /usr/libexec/xdg-desktop-portal

    # Fix for GTK apps slow startup
    0_environment = dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY

    # Polkit
    polkit = lxqt-policykit-agent

    # EasyEffects
    easyeffects = easyeffects --gapplication-service

    # Waybar
    waybar = waybar

    # CopyQ
    copyq = copyq

    # Blueman applet
    btapplet = blueman-applet

    # NetworkManager applet wifi icon
    nmapplet = nm-applet

    # Idle
    idle = swayidle before-sleep swaylock

    # Screensharing
    0_0 = systemctl --user import-environment
    xdg = sleep 1 && (XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway ${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal --replace & ${pkgs.xdg-desktop-portal-wlr}/libexec/xdg-desktop-portal-wlr)

    # Idle
    [idle]
    screensaver_timeout = 60
    dpms_timeout = 90

    # Applications ─────────────────────────────────────────────────────────────────

    [command]

    # Start a terminal
    # https://github.com/alacritty/alacritty
    binding_terminal = <super> KEY_Q
    command_terminal = kitty

    # Start your launcher
    # https://hg.sr.ht/~scoopta/wofi
    # Note: Add mode=run or mode=drun to ~/.config/wofi/config.
    # You can also specify the mode with --show option.
    binding_launcher = <ctrl> KEY_SPACE
    command_launcher = rofi -show combi -combi-modes "window,drun" -modes combi

    # Screenshots
    binding_screenshot = KEY_SYSRQ
    command_screenshot = grim -g "$(slurp)" - | wl-copy
    binding_screenshot_interactive = <shift> KEY_SYSRQ
    command_screenshot_interactive = slurp | grim -g - /home/jakub/Screenshots/$(date '+%F_%T').jpg

    binding_filemanager = <super> KEY_T
    command_filemanager = thunar

    binding_browser = <super> KEY_B
    command_browser = floorp

    binding_discord = <super> KEY_D
    command_discord = vesktop

    binding_previous = <super> KEY_Z
    command_previous = playerctl previous
    binding_next = <super> KEY_C
    command_next = playerctl next
    binding_playpause = <super> KEY_X
    command_playpause = playerctl play-pause

    binding_previousbutton = KEY_PREVIOUSSONG
    command_previousbutton = playerctl previous
    binding_nextbutton = KEY_NEXTSONG
    command_nextbutton = playerctl next
    binding_playpausebutton = KEY_PLAYPAUSE
    command_playpausebutton = playerctl play-pause

    binding_logout = <super> KEY_L
    command_logout = nwg-bar

    binding_copyq = <super> KEY_V
    command_copyq = copyq toggle

    binding_mute = KEY_MUTE
    command_mute = wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    repeatable_binding_volume_up = KEY_VOLUMEUP
    command_volume_up = wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
    repeatable_binding_volume_down = KEY_VOLUMEDOWN
    command_volume_down = wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-

    repeatable_binding_light_up = KEY_BRIGHTNESSUP
    command_light_up = brightnessctl set +1
    repeatable_binding_light_down = KEY_BRIGHTNESSDOWN
    command_light_down = brightnessctl set 1-

    binding_lock = <super> <shift> KEY_ESC
    command_lock = swaylock -c 000000 -eKL --indicator-idle-visible

    # Windows ──────────────────────────────────────────────────────────────────────

    # Actions related to window management functionalities.
    #
    # Example configuration:
    #
    # [wm-actions]
    # toggle_fullscreen = <super> KEY_F
    # toggle_always_on_top = <super> KEY_X
    # toggle_sticky = <super> <shift> KEY_X

    # Position the windows in certain regions of the output.
    [grid]
    #
    # ⇱ ↑ ⇲   │ 7 8 9
    # ← f →   │ 4 5 6
    # ⇱ ↓ ⇲ d │ 1 2 3 0
    # ‾   ‾
    slot_bl = <super> KEY_KP1
    slot_b = <super> KEY_KP2
    slot_br = <super> KEY_KP3
    slot_l = <super> KEY_LEFT | <super> KEY_KP4
    slot_c = <super> KEY_UP | <super> KEY_KP5
    slot_r = <super> KEY_RIGHT | <super> KEY_KP6
    slot_tl = <super> KEY_KP7
    slot_t = <super> KEY_KP8
    slot_tr = <super> KEY_KP9
    # Restore default.
    restore = <super> KEY_DOWN | <super> KEY_KP0

    # Change active window with an animation.
    [switcher]
    next_view = <alt> KEY_TAB
    prev_view = <alt> <shift> KEY_TAB

    # Simple active window switcher.
    [fast-switcher]
    activate = <alt> KEY_ESC

    [wm-actions]
    minimize = <super> KEY_N
    toggle_maximize = <super> KEY_M

    [place]
    mode = center

    # use lswt command to find the app_id. Can be with nix-shell -p lswt. Use lswt -w
    [window-rules]
    copyq_size = on created if app_id is "com.github.hluk.copyq" then resize 500 500

    # Workspaces ───────────────────────────────────────────────────────────────────

    # Switch to workspace.
    [vswitch]
    binding_left = <ctrl> <super> KEY_LEFT
    binding_down = <ctrl> <super> KEY_DOWN
    binding_up = <ctrl> <super> KEY_UP
    binding_right = <ctrl> <super> KEY_RIGHT
    # Move the focused window with the same key-bindings, but add Shift.
    with_win_left = <super> <shift> KEY_LEFT
    with_win_down = <super> <shift> KEY_DOWN
    with_win_up = <super> <shift> KEY_UP
    with_win_right = <super> <shift> KEY_RIGHT

    # Show the current workspace row as a cube.
    # [cube]
    # activate = <ctrl> <alt> BTN_LEFT
    # Switch to the next or previous workspace.
    # rotate_left = <super> <ctrl> KEY_H
    # rotate_right = <super> <ctrl> KEY_L

    # Show an overview of all workspaces.
    [expo]
    toggle = <super> KEY_E
    # Select a workspace.
    # Workspaces are arranged into a grid of 3 × 3.
    # The numbering is left to right, line by line.
    #
    # ⇱ k ⇲
    # h ⏎ l
    # ⇱ j ⇲
    # ‾   ‾
    # See core.vwidth and core.vheight for configuring the grid.
    select_workspace_1 = KEY_1
    select_workspace_2 = KEY_2
    select_workspace_3 = KEY_3
    select_workspace_4 = KEY_4
    select_workspace_5 = KEY_5
    select_workspace_6 = KEY_6
    select_workspace_7 = KEY_7
    select_workspace_8 = KEY_8
    select_workspace_9 = KEY_9

    # Outputs ──────────────────────────────────────────────────────────────────────

    # Change focused output.
    [oswitch]
    # Switch to the next output.
    next_output = <super> KEY_O
    # Same with the window.
    next_output_with_win = <super> <shift> KEY_O

    # Invert the colors of the whole output.
    # [invert]
    # toggle = <super> KEY_I

    # Send toggle menu event.
    [wayfire-shell]
    toggle_menu = <super>
  '';

  home.file.".config/wf-shell.ini".text = ''
    [background]
    image = /home/jakub/NixOS-dotfiles/core/home-manager/client/wallpapers/wallpaper2.jpg
    fill_mode = stretch
  '';
}
