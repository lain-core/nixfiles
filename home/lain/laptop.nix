{ config, pkgs, ... }:
{
  imports = [
    ./user.nix
    ../../default.nix
    ./gnome.nix
  ];

  hardware.enableRedistributableFirmware = true;

  # Kernel bug hangs laptop after shutdown currently
  boot.kernelPackages = pkgs.linuxPackages_zen;
}