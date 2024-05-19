# To-Do
- home-manager integration and deployment
- begin organizing system into modules
  
# home-manager and flakes
- Look at other home.nix configs to shape an idea of what other people are segmenting out of their base configuration file.. currently thinking ( system | user ) level separation first then I can turn parts of the code into modules over time.
- the way I'm declaring my user in home-manager is incorrect, need to pick this apart (might find clues in other repos)

# Cool ideas - look into these:
- ryan4yin has private repos with wallpapers he retrieves in his config via ssh in his flake.nix 
- Another user had a flake based implementation with separate configs based on host and can be specified with .#(hostname) syntax
- on paper, home-manager should be able to make portable personal configs independent of distros so additional fiddling to be done to make this happen

# Pre-requisites
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
[Look into automating pre-deployment steps]
