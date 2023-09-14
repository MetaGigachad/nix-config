{
  description = "metagigachad's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland/v0.28.0";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixpkgs-unstable, ... }@inputs: 
  let
    inherit (self) outputs;
  in
  {
    overlays = import ./overlays { inherit inputs; };

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
          [ ./home-manager/home.nix hyprland.homeManagerModules.default ];
      };
    };
  };
}
