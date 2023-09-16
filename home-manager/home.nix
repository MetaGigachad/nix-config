{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    outputs.homeManagerModules.chad-qt
    ./features/toolchains.nix
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
      restish
      zip
      unzip
      wget
      killall

      # QT
      (catppuccin-kvantum.override {
        variant = "Mocha";
        accent = "Lavender";
      })

      # GUI
      vlc
      kitty
      zathura
      brave
      telegram-desktop
      obs-studio
      discord
      zoom-us
      qbittorrent
      libreoffice
      inkscape
      chromium
      xarchiver
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
  chad-qt = {
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
