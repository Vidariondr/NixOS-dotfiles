{
  config,
  pkgs,
  ...
}: {
  home.file.".config/wayfire.ini".text = ''
    # Input configuration ──────────────────────────────────────────────────────────

    [input]
    xkb_layout = us,pl,gb
    xkb_options = grp:lctrl_lshift_toggle

    mouse_accel_profile = none
    mouse_cursor_speed = -1
    cursor_theme = phinger-cursors-dark

    # Output configuration ─────────────────────────────────────────────────────────

    [output:DP-1]
    mode = 2560x1440@180
    position = 0,0
    transform = normal
    scale = 1.000000

    [output:DP-3]
    mode = 2560x1440@180
    position = 2560,0
    transform = normal
    scale = 1.000000

    # Core options ─────────────────────────────────────────────────────────────────

    [core]

    # List of plugins to be enabled.
    # See the Configuration document for a complete list.
    plugins = alpha animate autostart command decoration expo fast-switcher grid gtk-shell move place resize scale vswitch wayfire-shell window-rules wm-actions zoom foreign-toplevel xdg-activation

    # Close focused window.
    close_top_view = <super> <shift> KEY_C | <alt> KEY_F4

    # Workspaces arranged into a grid: 3 × 3.
    vwidth = 3
    vheight = 3

    # Prefer client-side decoration or server-side decoration
    preferred_decoration_mode = client

    # Turn on X11 for other windows
    xwayland = true

    # Focus action will work even when modifiers are pressed.
    focus_button_with_modifiers = true

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
    portal = ${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal

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

    # NetworkManager applet wifi icon
    nmapplet = nm-applet

    # Screensharing
    0_0 = systemctl --user import-environment
    xdg = sleep 1 && (XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway ${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal --replace & ${pkgs.xdg-desktop-portal-wlr}/libexec/xdg-desktop-portal-wlr)

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
    binding_launcher = <super> KEY_SPACE
    command_launcher = rofi -show combi -combi-modes "window,drun" -modes combi

    # Screenshots
    binding_screenshot = <super> KEY_P
    command_screenshot = grim -g "$(slurp)" - | wl-copy
    binding_screenshot_interactive = <super> <shift> KEY_P
    command_screenshot_interactive = slurp | grim -g - /home/jakub/Screenshots/$(date '+%F_%T').jpg

    binding_filemanager = <super> KEY_T
    command_filemanager = nemo

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

    binding_logout = <super> KEY_L
    command_logout = nwg-bar

    binding_copyq = <super> KEY_V
    command_copyq = copyq toggle

    binding_gsr = <super> KEY_R
    command_gsr = killall -SIGUSR1 gpu-screen-recorder && notify-send "Replay saved"

    # Windows ──────────────────────────────────────────────────────────────────────

    # Actions related to window management functionalities.
    #
    # Example configuration:
    #
    [wm-actions]
    # toggle_fullscreen = <super> KEY_F
    toggle_always_on_top = <super> KEY_S
    toggle_sticky = <super> <shift> KEY_S

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

    [scale]
    toggle = <super> KEY_TAB
    duration = 200
    allow_zoom = true
    middle_click_close = true
    include_minimized = true
    close_on_new_view = true
    outer_margin = 100
    title_position = top

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

    # Invert the colors of the whole output.
    # [invert]
    # toggle = <super> KEY_I

    # Send toggle menu event.
    [wayfire-shell]
    toggle_menu = <super>

    # Solve focusing issues
    [xdg-activation]
    check_surface = true
    only_last_request = true
  '';

  xdg.configFile."wf-shell.ini".source = config.lib.file.mkOutOfStoreSymlink "/home/jakub/NixOS-dotfiles/home-manager/main-pc/jakub/wayfire/wf-shell.ini";
}
