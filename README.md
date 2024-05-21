# Installation
```
sudo nixos-rebuild switch --flake github:k0udo/nixos --impure
```
  - Impure flag is used to the default /etc/nixos path for your hardware configuration 
  - Assumes nix-commands and flakes are already enabled see https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-with-flakes-enabled
# Description
- My skeleton Nix set up (Under construction!)

# Planned
- Component Modularization
- Separate configuration calls dependent on host
- shift zsh config into home-manager for reproducability  
