{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.wayland = true;

  networking.hostName = "miorine"; # Define your hostname.

  hardware.enableRedistributableFirmware = true;

  # Kernel bug hangs laptop after shutdown currently
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # TODO: modify this
  users.users.lain = {
    isNormalUser = true;
    home = "/home/lain";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "password"; # Change on first boot
  };

  imports = [
    ./configuration.nix
    ../../../nixos/default.nix
    ../../../nixos/de/gnome.nix
    ../../../nixos/jp/default.nix
    ../../../nixos/programs/firefox.nix
    ../../../nixos/programs/steam.nix
    ../../../nixos/programs/zsh/zsh.nix
  ];
}
