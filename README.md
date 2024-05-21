# Installation
Add the following into your /etc/nixos/configuration.nix
```
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
Adding this line will enable the commands needed to begin using flakes. Next, rebuild your system by opening a terminal and running:
```
sudo nixos-rebuild switch
```
now you should be able to install this remote flake by running:
```
sudo nixos-rebuild switch --flake github:k0udo/nixos --impure
```
  - Impure flag is used to point to the default /etc/nixos path for your hardware configuration 

# Description
- My skeleton Nix set up (Under construction!)

# Planned
- Component Modularization
- Separate configuration calls dependent on host
- shift zsh config into home-manager for reproducability  
