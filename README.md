# To-Do
- further integrate home-manager, goal is to have a good base config to transfer into my desktop PC
  - Document pre-requirements - channel switch + a stable vanilla config to jump to (test portability via VM)
  - Need to grasp and solidy understanding of how Nix Flakes are used and what the command flow looks like when trying to update packages (and if there are any other useful commands to keep in mind)  
- figure out what goes in home.nix and figure out if this requires a seperate rebuild command in a NixOS module installation
- figure out how to declare customizations in-code to minimize time needed to customize
- work to replace hard paths with system variables
- figure out secrets management and how to reliably deploy my configs across different systems
- I've seen some people use their flakes to pull down programs from repos and code in the config steps needed
  - its a pita to go through the first time but I think I can figure this out 
- Need to figure out how to set up Flake file outputs to behave how I'm expecting (and how to set it up so its legible)

# home-manager
- home-manager init also generates flake.nix
- https://github.com/nix-community/home-manager
- does this rebuild separate of my os rebuilds?

# Flakes
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
