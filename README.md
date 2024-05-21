# Installation
Great Resource: https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-with-flakes-enabled 

Add the following into your /etc/nixos/configuration.nix
```
nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Flakes clones its dependencies through the git command,
# so git must be installed first

environment.systemPackages = with pkgs; [
  # Flakes clones its dependencies through the git command,
  # so git must be installed first
  git
  wget
  curl
  ];
```
Adding this line will enable the commands needed to begin using flakes. **Flakes are considered an experimental feature and may be subject to breaking changes use at your own risk**
Next, rebuild your system by opening a terminal and running:
```
sudo nixos-rebuild switch
```
now you should be able to install this remote flake by running:
```
sudo nixos-rebuild switch --flake github:k0udo/nixos --impure
```
  - Impure flag is used to point to the default /etc/nixos path for your hardware configuration 

# Description
- My skeleton NixOS set up (Under construction!)

# Planned
- Component Modularization
- Separate configuration calls dependent on host
- shift zsh config into home-manager for reproducability  
