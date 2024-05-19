{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, catppuccin, home-manager, ... }: {
      nixosConfigurations."onix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jeff = import ./home.nix;
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
          ];
        };

  };
}
