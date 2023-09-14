{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./features/toolchains.nix
    ./features/overlays.nix
    ./features/clangd.nix
    ./features/zathura.nix
    ./features/kitty.nix
    ./features/neovim.nix
    ./features/xdg.nix
    ./features/zsh.nix
    ./features/hyprland.nix
    ./features/vscode.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "metagigachad";
    homeDirectory = "/home/metagigachad";
    packages = with pkgs; [
      # Virtualization
      docker
      qemu_kvm

      # Tools
      procps
      htop
      bluetuith
      tldr
      unstable.restish
      zip
      unzip
      wget
      killall

      # QT
      (unstable.catppuccin-kvantum.override {
        variant = "Mocha";
        accent = "Lavender";
      })

      # GUI
      vlc
      kitty
      zathura
      unstable.brave
      unstable.telegram-desktop
      unstable.obs-studio
      unstable.discord
      unstable.zoom-us
      qbittorrent
      libreoffice
      inkscape
      unstable.chromium
      xarchiver
      unstable.steam
    ];
    sessionVariables = { SHELL = "zsh"; };
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "metagigachad";
    userEmail = "metagigachad@gmail.com";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-dark";
      package = pkgs.unstable.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.unstable.catppuccin-papirus-folders;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "kvantum";
  };
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Lavender-Cursors";
    package = pkgs.unstable.catppuccin-cursors.mochaLavender;
    size = 16;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
