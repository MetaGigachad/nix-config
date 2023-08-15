# Metagigachad's Nix/NixOS config

## How to build

Run in repo directory:

```sh
# NixOS
sudo nixos-rebuild switch --flake .#honor

# Home manager (you have to have nix installed)
home-manager switch --flake .#metagigachad@honor # if you do have home-manager
nix-shell -p home-manager --run home-manager switch --flake .#metagigachad@honor # if you don't
```

> **WARNING**: It is not guaranteed that home-manager config will work correctly standalone.
