{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking.hostName = "honor";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;

  time.timeZone = "Europe/Minsk";

  users.users = {
    metagigachad = {
      initialPassword = "1111";
      isNormalUser = true;
      extraGroups = [ "wheel" "vboxsf" "docker" ];
    };
  };

  hardware.opengl = { enable = true; };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-gtk.override {
      accents = [ "lavender" ];
      size = "standard";
      variant = "mocha";
    })
    catppuccin-papirus-folders
    catppuccin-cursors.mochaLavender
    catppuccin-sddm-corners
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
  ];
  fonts.packages = with pkgs; [ ubuntu_font_family ];

  programs.hyprland.enable = true;

  services.xserver = {
    enable = true;

    libinput = {
      enable = true;
      mouse = { accelProfile = "flat"; };
      touchpad = { accelProfile = "flat"; };
    };
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-sddm-corners";
        settings = {
          Theme = { CursorTheme = "Catppuccin-Mocha-Lavender-Cursors"; };
        };
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;
  programs.ssh.startAgent = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  services.gvfs = {
    enable = true;
    package = (pkgs.gvfs.override { udevSupport = true; });
  };
  services.tumbler.enable = true;

  hardware.bluetooth.enable = true;

  environment.loginShellInit = ''
    if [ -e $HOME/.zshenv ]
    then
    	. $HOME/.zshenv
    fi
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
