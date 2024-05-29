{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.wayland = true;

  networking.hostName = "miorine"; # Define your hostname.

  hardware.enableRedistributableFirmware = true;

  # Kernel bug hangs laptop after shutdown currently
  boot.kernelPackages = pkgs.linuxPackages_zen;

  imports = [
    ./configuration.nix
    ../../nixos/
    ../../nixos/de/gnome.nix
    ../../nixos/programs/firefox.nix
    ../../nixos/programs/steam.nix
    ../../nixos/programs/zsh/zsh.nix
  ];
}
