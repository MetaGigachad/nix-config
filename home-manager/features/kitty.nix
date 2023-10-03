{
  xdg.configFile."kitty/themes/catppuccin-latte.conf".text = ''
    # vim:ft=kitty
    
    ## name:     Catppuccin Kitty Latte
    ## author:   Catppuccin Org
    ## license:  MIT
    ## upstream: https://github.com/catppuccin/kitty/blob/main/themes/latte.conf
    ## blurb:    Soothing pastel theme for the high-spirited!
    
    
    
    # The basic colors
        foreground              #4C4F69
        background              #EFF1F5
        selection_foreground    #EFF1F5
        selection_background    #DC8A78
    
    # Cursor colors
        cursor                  #DC8A78
        cursor_text_color       #EFF1F5
    
    # URL underline color when hovering with mouse
        url_color               #DC8A78
    
    # Kitty window border colors
        active_border_color     #7287FD
        inactive_border_color   #9CA0B0
        bell_border_color       #DF8E1D
    
    # OS Window titlebar colors
        wayland_titlebar_color system
        macos_titlebar_color system
    
    # Tab bar colors
        active_tab_foreground   #EFF1F5
        active_tab_background   #8839EF
        inactive_tab_foreground #4C4F69
        inactive_tab_background #9CA0B0
        tab_bar_background      #BCC0CC
    
    # Colors for marks (marked text in the terminal)
        mark1_foreground #EFF1F5
        mark1_background #7287fD
        mark2_foreground #EFF1F5
        mark2_background #8839EF
        mark3_foreground #EFF1F5
        mark3_background #209FB5
    
    # The 16 terminal colors
    
    # black
        color0 #5C5F77
        color8 #6C6F85
    
    # red
        color1 #D20F39
        color9 #D20F39
    
    # green
        color2  #40A02B
        color10 #40A02B
    
    # yellow
        color3  #DF8E1D
        color11 #DF8E1D
    
    # blue
        color4  #1E66F5
        color12 #1E66F5
    
    # magenta
        color5  #EA76CB
        color13 #EA76CB
    
    # cyan
        color6  #179299
        color14 #179299
    
    # white
        color7  #ACB0BE
        color15 #BCC0CC
  '';

  xdg.configFile."kitty/themes/catppuccin-mocha.conf".text = ''
    # vim:ft=kitty

    ## name:     Catppuccin Kitty Mocha
    ## author:   Catppuccin Org
    ## license:  MIT
    ## upstream: https://github.com/catppuccin/kitty/blob/main/mocha.conf
    ## blurb:    Soothing pastel theme for the high-spirited!

    # The basic colors
    foreground              #CDD6F4
    background              #1E1E2E
    selection_foreground    #1E1E2E
    selection_background    #F5E0DC

    # Cursor colors
    cursor                  #F5E0DC
    cursor_text_color       #1E1E2E

    # URL underline color when hovering with mouse
    url_color               #F5E0DC

    # Kitty window border colors
    active_border_color     #B4BEFE
    inactive_border_color   #6C7086
    bell_border_color       #F9E2AF

    # OS Window titlebar colors
    wayland_titlebar_color system
    macos_titlebar_color system

    # Tab bar colors
    active_tab_foreground   #11111B
    active_tab_background   #CBA6F7
    inactive_tab_foreground #CDD6F4
    inactive_tab_background #181825
    tab_bar_background      #11111B

    # Colors for marks (marked text in the terminal)
    mark1_foreground #1E1E2E
    mark1_background #B4BEFE
    mark2_foreground #1E1E2E
    mark2_background #CBA6F7
    mark3_foreground #1E1E2E
    mark3_background #74C7EC

    # The 16 terminal colors

    # black
    color0 #45475A
    color8 #585B70

    # red
    color1 #F38BA8
    color9 #F38BA8

    # green
    color2  #A6E3A1
    color10 #A6E3A1

    # yellow
    color3  #F9E2AF
    color11 #F9E2AF

    # blue
    color4  #89B4FA
    color12 #89B4FA

    # magenta
    color5  #F5C2E7
    color13 #F5C2E7

    # cyan
    color6  #94E2D5
    color14 #94E2D5

    # white
    color7  #BAC2DE
    color15 #A6ADC8
  '';

  xdg.configFile."kitty/kitty.conf".text = ''
    include themes/catppuccin-latte.conf

    # Fonts
    font_family      JetBrains Mono Nerd Font
    bold_font        auto
    italic_font      auto
    bold_italic_font auto
    font_size 13

    symbol_map U+3000-U+30FF Hanazono

    # Cursor
    cursor_shape block

    # Window
    remember_window_size  no
    initial_window_width  640
    initial_window_height 400
    confirm_os_window_close 0
    hide_window_decorations yes

    # Cosmetics
    background_opacity 1

    # Apps
    shell zsh
    editor nvim

    # Etc
    shell_integration enabled no-cursor
    enable_audio_bell no

    # Mappings
    map f1 launch --cwd=current --type=os-window

    # ## Layouts
    # map alt+l next_layout
    #
    # ## Tabs
    # map alt+1 goto_tab 1
    # map alt+2 goto_tab 2
    # map alt+3 goto_tab 3
    # map alt+4 goto_tab 4
    # map alt+5 goto_tab 5
    # map alt+6 goto_tab 6
    # map alt+7 goto_tab 7
    # map alt+8 goto_tab 8
    # map alt+9 goto_tab 9
    #
    # ## Windows
    # map alt+return new_window
    # map alt+j next_window
    # map alt+k previous_window
    # map alt+c close_window
    # map alt+shift+k move_window_to_top
  '';
}
