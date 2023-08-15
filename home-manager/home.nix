{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./features/clangd.nix
    ./features/zathura.nix
    ./features/kitty.nix
    ./features/xdg.nix
    ./features/zsh.nix
    ./features/hyprland.nix
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
      # CLI/TUI 
      htop
      bluetuith
      vlc
      tldr

      # QT
      (catppuccin-kvantum.override {
        variant = "Mocha";
        accent = "Lavender";
      })

      # GUI
      kitty
      zathura
      brave
      telegram-desktop
      obs-studio
      discord
      zoom
      qbittorrent
      libreoffice

      # Build deps
      gcc
      glibcLocales
      procps
      binutils
      python3
      python3Packages.pip
      nodejs
      cargo
      zip
      unzip
      wget

      # Neovim
      neovim
      nixfmt
      stylua
    ];
  };

  xdg.configFile = { "clangd".source = ../xdg/config/clangd; };

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
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "kvantum";
  };
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Lavender-Cursors";
    package = pkgs.catppuccin-cursors.mochaLavender;
    size = 16;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
