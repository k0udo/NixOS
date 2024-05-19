{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, catppuccin, home-manager, ... }@inputs:{
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ];
        };
      homeConfigurations."jeff" = home-manager.lib.homeManagerConfiguration {
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      
      # catppuccin.flavour = "macchiato";
  };
}
