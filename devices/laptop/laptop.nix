{ pkgs, ... }:
{
  imports = [
    ./configuration.nix
  ];
  networking.hostName = "miorine"; # Define your hostname.

  hardware.enableRedistributableFirmware = true;

  # Kernel bug hangs laptop after shutdown currently
  boot.kernelPackages = pkgs.linuxPackages_zen;
}