# To-Do
- Covert system to be Flakes based 
- set up home-manager config to be modular and contain my personal customizations
- Document processes and workflow
- Set up Flakes output to function in a simple structure (calls to  home / system config)
  - Documentation for getting started is horrible, I'm stuck as hail
  

# home-manager
- need to find and understand how/what the set up looks like when making home-manager rebuild off of a nixos-rebuild 

# Flakes
- `nix flake check`
- `nix flake update` - updates dependencies 
- `sudo nixos-rebuild switch --flake /home/jeff/Repos/nixos# (need to learn how flakes are named))`
- I understand how to point to it for a rebuild now - now I need to understand how to set up my outputs to behave in the way I'm expecting
- also I'm seeing use cases where people are naming their flakes instead of using default - I need to learn how this works
- also seeing single git repos manage multiple hosts, I'd be interested how this is implemented - this might uncover how to call home manager (assuming my current path doesn't rebuild it how I expect)

# Customization Notes
- zsh is declared in configuartion.nix > move this into home.nix?
  -  
- sddm in kde6? might need to find kcm6 and frankenstein it into my config

# Current Structure & Target Architecture
- Config layout is fairly simple and code in files is fairly dense, I should look at other configs to get some inspiration on sorting my project 

# Pre-requisites
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
[Look into automating pre-deployment steps]
