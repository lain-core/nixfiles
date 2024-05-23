{
  description = "NixOS configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    nixosConfigurations = {
      miorine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./default.nix
          ./devices/laptop/laptop.nix
        ];
      };

      suletta = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./default.nix
          ./devices/desktop/desktop.nix
        ];
      };
    };
  };

}
