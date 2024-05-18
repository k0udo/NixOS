# To-Do
- further integrate home-manager, goal is to have a good base config to transfer into my desktop PC
  - Document pre-requirements - channel switch + a stable vanilla config to jump to (test portability via VM)
  - Need to grasp and solidy understanding of how Nix Flakes are used and what the command flow looks like when trying to update packages (and if there are any other useful commands to keep in mind)  
- figure out what goes in home.nix and figure out if this requires a seperate rebuild command in a NixOS module installation
- figure out how to declare customizations in-code to minimize time needed to customize
- work to replace hard paths with system variables
- figure out secrets management and how to reliably deploy my configs across different systems

# home-manager
- home-manager init also generates flake.nix
- https://github.com/nix-community/home-manager
- does this rebuild separate of my os rebuilds?


# Flakes


# Customization Notes
- zsh is declared in configuartion.nix > move this into home.nix?
- sddm in kde6? might need to find kcm6 and frankenstein it into my config

# Currnet Structure & Target Architecture
- Config layout is fairly simple and code in files is fairly dense, I should look at other configs to get some inspiration on sorting my project 


# Pre-requisites
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update

[Look into automating pre-deployment steps]
