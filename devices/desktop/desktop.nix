{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Nvidia doesn't play nice with wayland at all.
  services.xserver.displayManager.gdm.wayland = false;

  hardware.nvidia = {
    open = false;
    powerManagement.enable = true;
    nvidiaSettings = true;
    nvidiaPersistenced = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = [
    pkgs.gwe
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  networking.hostName = "suletta"; # Define your hostname.

  networking.interfaces.eth0.ipv4.addresses = [{
    address = "192.168.1.111";
    prefixLength = 24;
  }];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];

  # Pin in this: https://nixos.org/manual/nixos/stable/#sec-weechat

  nix.gc.automatic = true;
  nix.gc.dates = "00:00";
}
