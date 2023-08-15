{ pkgs, config, ... }: {
  imports = [ ./waybar.nix ./rofi.nix ./dunst.nix ./swaylock.nix ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Ubuntu" ]; })
    hanazono
    ubuntu_font_family

    # Apps
    grim
    slurp
    pamixer
    brightnessctl
    wl-clipboard
    swaybg
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # COLORSCHEME
      $rosewater = 0xfff5e0dc
      $flamingo  = 0xfff2cdcd
      $pink      = 0xfff5c2e7
      $mauve     = 0xffcba6f7
      $red       = 0xfff38ba8
      $maroon    = 0xffeba0ac
      $peach     = 0xfffab387
      $green     = 0xffa6e3a1
      $teal      = 0xff94e2d5
      $sky       = 0xff89dceb
      $sapphire  = 0xff74c7ec
      $blue      = 0xff89b4fa
      $lavender  = 0xffb4befe
      
      $text      = 0xffcdd6f4
      $subtext1  = 0xffbac2de
      $subtext0  = 0xffa6adc8
      
      $overlay2  = 0xff9399b2
      $overlay1  = 0xff7f849c
      $overlay0  = 0xff6c7086
      
      $surface2  = 0xff585b70
      $surface1  = 0xff45475a
      $surface0  = 0xff313244
      
      $base      = 0xff1e1e2e
      $mantle    = 0xff181825
      $crust     = 0xff11111b

      # STYLE
      exec-once = waybar
      exec-once = swaybg -i ${../../assets/wallpaper.jpg}
      exec-once = dunst
      exec-once = ${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1
      
      general {
        gaps_in = 0
        gaps_out = 0
        border_size = 2
        col.active_border = $surface0
        col.inactive_border = $mantle
      }
      decoration {
        rounding = 0
      }
      animations {
        enabled = false
      }

      # ETC
      misc {
        focus_on_activate = true
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }

      input {
        kb_layout = us,ru
        kb_variant = grp:win_space_toggle
        follow_mouse = 1
        accel_profile = flat
        touchpad {
          natural_scroll = 1
          scroll_factor = 0.5
        }
      }

      general {
        no_cursor_warps = true
        resize_on_border = true
        layout = master
      }

      master {
        mfact = 0.5
        new_is_master = false
        inherit_fullscreen = false
        no_gaps_when_only = 1
      }

      dwindle {
        pseudotile = yes
        preserve_split = yes
        no_gaps_when_only = 1
      }

      gestures {
        workspace_swipe = 1
      }

      # WINDOW RULES
      windowrule = tile, Spotify
      windowrule = float, telegram-desktop
      windowrule = float, REAPER
      windowrule = float, xdg-desktop-portal-gtk
      windowrule = workspace 4, Emacs
      windowrule = workspace 5, Gimp
      windowrule = workspace 5, DesktopEditors
      windowrule = workspace 6, obs
      windowrule = workspace 7, discord
      windowrule = workspace 7, zoom
      windowrule = workspace 8, telegram
      windowrule = workspace 8, Spotify
      windowrule = workspace 9, Brave

      # KEYBINDINGS
      $mainMod = SUPER

      # Launchers
      bind = $mainMod, Return, exec, kitty
      bind = $mainMod SHIFT, Return, exec, rofi -show drun -modi drun
      bind = $mainMod, B, exec, brave
      bind = $mainMod SHIFT, E, exec, kitty nvim ~

      # Controls
      bind = $mainMod SHIFT, C, killactive, 
      bind = $mainMod CTRL, Q, exit, 
      bind = $mainMod SHIFT, Space, togglefloating, 
      bind = $mainMod, F, fullscreen, 0

      # Pulseaudio control
      bind = $mainMod, up, exec, pamixer -i 5
      bind = $mainMod, down, exec, pamixer -d 5
      bind = $mainMod SHIFT, M, exec, pamixer -t

      # Brightness control
      bind = $mainMod SHIFT, up, exec, brightnessctl set 5%+
      bind = $mainMod SHIFT, down, exec, brightnessctl set 5%-

      # Utils
      bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy
      bind = $mainMod SHIFT, P, exec, toggle-bluetooth-device 98:DD:60:E6:ED:52
      bind = $mainMod, Space, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next

      # In-workspace window control
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, J, movefocus, d
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, L, movefocus, r
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, J, movewindow, d
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, L, movewindow, r
      bindm = $mainMod, mouse:272, movewindow     # LMB

      # Switch workspaces
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
    '';
  };
}