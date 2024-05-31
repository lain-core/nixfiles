{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  # inputs @ passes in the inputs group from above, but only for this file.
  outputs = inputs @ { nixpkgs, home-manager, nixos-hardware, nixvim, ... }: {

    nixosConfigurations = {
      miorine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Hardware determines the system packages
          ./hardware/miorine/nixos/default.nix

          nixos-hardware.nixosModules.framework-13-7040-amd

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; }; # Allows home-manager access to all of the inputs includes
            # Hardware can import user packages as desired
            home-manager.users.lain = import ./hardware/miorine/home/home.nix;
          }
        ];
      };

      suletta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Hardware determines the system packages it wants
          ./hardware/suletta/nixos/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; }; # Allows home-manager access to all of the inputs includes

            # User determines the home packages they want
            home-manager.users.lain = import ./hardware/suletta/home/home.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      "lain" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home/users/lain/home.nix
        ];
      };
    };
  };

}
