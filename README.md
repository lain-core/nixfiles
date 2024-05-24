# Nixfiles
NixOS flake for my personal PC setups.

- `miorine` is for 13-inch framework laptop w/ amd
- `suletta` is for desktop w/ nvidia gfx card

## Usage
To set up fully, the `configuration.nix` and `hardware-configuration.nix` that are generated needed to be added to either the `devices/desktop` or `devices/laptop`. Then just run `sudo nixos-rebuild switch --flake .#miorine`, or `sudo home-manager switch --flake .`
