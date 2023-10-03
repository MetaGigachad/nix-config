{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    outputs.homeManagerModules.chad-qt
    ./features/direnv.nix
    ./features/toolchains.nix
    ./features/clangd.nix
    ./features/zathura.nix
    ./features/kitty.nix
    ./features/neovim.nix
    ./features/xdg.nix
    ./features/zsh.nix
    ./features/hyprland.nix
    ./features/vscode.nix
    ./features/git.nix
    ./features/gtk.nix
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

      # Man
      man-pages

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
      sqlite
      sqlite-web
      grpcurl

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
      gnome.file-roller
      gnome.eog
      webcord
    ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
