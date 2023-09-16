{
  description = "metagigachad's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixpkgs-unstable, ... }@inputs: 
  let
    inherit (self) outputs;
  in
  {
    homeManagerModules = import ./modules/home-manager;
    
    nixosConfigurations = {
      honor = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ ./nixos/configuration.nix ];
      };
    };

    homeConfigurations = {
      "metagigachad@honor" = home-manager.lib.homeManagerConfiguration {
        pkgs =
          nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs outputs; };
        modules =
          [ ./home-manager/home.nix ];
      };
    };
  };
}
