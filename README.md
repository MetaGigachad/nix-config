# Metagigachad's Nix/NixOS config

## How to build

In repo root directory:

```sh
# NixOS 
# > run with root privilages
nixos-rebuild switch --flake '.#honor'

# Home manager
# > first setup nix and standalone home-manager, then run
home-manager switch --flake '.#metagigachad@nixos' # may need experimental-features flags
```
