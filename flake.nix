{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }: {

    nixosConfigurations = {
      miorine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Hardware determines the system packages
          ./devices/miorine/

          nixos-hardware.nixosModules.framework-13-7040-amd

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # User determines the home packages they want
            home-manager.users.lain = import ./home/users/lain/home.nix;
          }
        ];
      };

      suletta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Hardware determines the system packages it wants
          ./devices/suletta/

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # User determines the home packages they want
            home-manager.users.lain = import ./home/users/lain/home.nix;
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
