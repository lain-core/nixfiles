{ pkgs, ... }:
{
  imports = [
    ./configuration.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.wayland = true;

  networking.hostName = "miorine"; # Define your hostname.

  hardware.enableRedistributableFirmware = true;

  # Kernel bug hangs laptop after shutdown currently
  boot.kernelPackages = pkgs.linuxPackages_zen;
}