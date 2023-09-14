{ pkgs, config, ... }: {
  home.packages = with pkgs; [ tree lsd ];

  home.sessionVariables = {
    CLICOLOR = 1;
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    shellAliases = {
      # Nix
      system-update = "sudo nixos-rebuild switch --flake ~/nix-config/#honor";
      home-update =
        "home-manager switch --flake ~/nix-config/#metagigachad@honor";
      # Tree
      ls =
        "lsd -1 --blocks permission,name,date --date relative --group-dirs=first";
      la = "ls -A";
      lst = "tree --gitignore";
      lat = "lst -a -I .git";
      lstd = "lst -L";
      latd = "lat -L";
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
          rev = "v0.10.0";
          sha256 = "13ifm0667my9izsl2zwidf33vg6byjw5dnyrm27lcprn0g1rjkj0";
        };
      }
    ];
    initExtra = ''
      export PATH="./venv/bin:$PATH"
    '';
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
}
