{ config, pkgs, ... }:
{
  imports = [
    ./configuration.nix
  ];

  hardware.enableRedistributableFirmware = true;

  # Kernel bug hangs laptop after shutdown currently
  boot.kernelPackages = pkgs.linuxPackages_zen;
}