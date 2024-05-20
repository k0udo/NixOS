# To-Do
- further integrate home-manager 
  - shift user space declaration into home-manager 
- begin organizing files into modules
- need to figure out zsh implementation in home-manager + flakes (remove from nix config)
  
# home-manager and flakes
- I understand how flakes is managing versions in place of channels, now I need to figure out how I want to set up home-manager to make my CLI config redeployable across hosts

# Cool ideas - look into these:
- ryan4yin has private repos with wallpapers he retrieves in his config via ssh in his flake.nix 
- Another user had a flake based implementation with separate configs based on host and can be specified with .#(hostname) syntax
- on paper, home-manager should be able to make portable personal configs independent of distros so additional fiddling to be done to make this happen
- If i end up switching to a work issued VM I'll need to figure out how to install Citrix locally (if its too much a pita I can always just keep using the shittop)
- Doing local security testing doesn't seem viable due to lack of certain packages, should figure how the steps to getting a virtual machine set up 
  - Another fun side project could be to code up my own security toolkit to deploy on systems (git repo + bash script + uninstaller?)


# Pre-requisites
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
[Look into automating pre-deployment steps]
