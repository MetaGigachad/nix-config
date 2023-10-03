{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./features/direnv.nix
    ./features/clangd.nix
    ./features/zathura.nix
    ./features/kitty.nix
    ./features/zsh.nix
    ./features/git.nix
  ];

  targets.genericLinux.enable = true;
  
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

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
    sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
