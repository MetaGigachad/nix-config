{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
      patches = (oa.patches or [ ]) ++ [
        (pkgs.fetchpatch {
          name = "fix waybar hyprctl";
          url =
            "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
          sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
        })
      ];
    });
    settings = {
      topBar = {
        "layer" = "top";
        "modules-left" = [ "wlr/workspaces" ];
        "modules-center" = [ ];
        "modules-right" = [
          "tray"
          "hyprland/language"
          "network"
          "pulseaudio"
          "battery"
          "clock"
        ];
        "hyprland/language" = {
          "format" = "  {}";
          "format-en" = "en";
          "format-ru" = "ru";
          "keyboard-name" = "at-translated-set-2-keyboard";
        };
        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };
        "clock" = { "format" = "󰥔  {:<b>%b %d</b> %H:%M}"; };
        "pulseaudio" = {
          "tooltip" = false;
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰝟 {volume}%";
          "format-bluetooth" = " {volume}%";
          "format-icons" = {
            "default" = [ "󰕿" "󰖀" "󰕾" ];
            "headphones" = [ "󰋋" ];
          };
        };
        "network" = {
          "tooltip" = false;
          "format-wifi" = "󰤨  {essid} {ipaddr}";
          "format-ethernet" = "󰈁 {ipaddr}";
        };
        "battery" = {
          "format" = "{icon}   {capacity}%";
          "format-charging" = "󰚥 {capacity}%";
          "format-icons" = [ "" "" "" "" "" ];
        };
        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-click" = "activate";
        };
      };
    };
    style = ''
      /*
      *
      * Catppuccin Mocha palette
      * Maintainer: rubyowo
      *
      */

      @define-color base   #1e1e2e;
      @define-color mantle #181825;
      @define-color crust  #11111b;
      @define-color black  #09090e;

      @define-color text     #cdd6f4;
      @define-color subtext0 #a6adc8;
      @define-color subtext1 #bac2de;

      @define-color surface0 #313244;
      @define-color surface1 #45475a;
      @define-color surface2 #585b70;

      @define-color overlay0 #6c7086;
      @define-color overlay1 #7f849c;
      @define-color overlay2 #9399b2;

      @define-color blue      #89b4fa;
      @define-color lavender  #b4befe;
      @define-color sapphire  #74c7ec;
      @define-color sky       #89dceb;
      @define-color teal      #94e2d5;
      @define-color green     #a6e3a1;
      @define-color yellow    #f9e2af;
      @define-color peach     #fab387;
      @define-color maroon    #eba0ac;
      @define-color red       #f38ba8;
      @define-color mauve     #cba6f7;
      @define-color pink      #f5c2e7;
      @define-color flamingo  #f2cdcd;
      @define-color rosewater #f5e0dc;


      * {
      	border: none;
      	border-radius: 0;
      	font-family: Ubuntu Nerd Font;
        font-weight: 600;
      	font-size: 14px;
        background: @crust;
      }

      window#waybar {
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      #language {
      	padding-left: 16px;
      	padding-right: 16px;
      	transition: none;
      	color: @green;
      }

      #window {
          padding-left: 16px;
          padding-right: 16px;
      	transition: none;
          color: @text;
      	background: transparent;
      }

      #workspaces {
      	transition: none;
      }

      #workspaces button {
      	transition: none;
      	color: @text;
      	background: transparent;
      	padding-left: 12px;
      	padding-right: 12px;
      }

      #workspaces button.active {
          color: @mauve;
      }

      #workspaces button.urgent {
          color: @red;
      }

      #workspaces button:hover {
      	transition: none;
        box-shadow: none;
        text-shadow: none;
      	color: @mauve;
      }

      #network {
      	padding-left: 16px;
      	padding-right: 16px;
      	transition: none;
      	color: @mauve;
      }

      #pulseaudio {
      	padding-left: 16px;
      	padding-right: 16px;
      	transition: none;
      	color: @blue;
      }

      #battery {
      	padding-left: 16px;
      	padding-right: 16px;
      	transition: none;
      	color: @red;

      }

      #clock {
      	padding-left: 16px;
      	padding-right: 16px;
      	transition: none;
      	color: @text;
      }

      #tray {
      	padding-left: 16px;
      	padding-right: 16px;
      	transition: none;
      	color: @text;
      }
    '';
  };
}
