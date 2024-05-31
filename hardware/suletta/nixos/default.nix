{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.wayland = false;
    videoDrivers = [ "nvidia" ];
    deviceSection = ''
      Option "Coolbits" "28"
    '';
  };

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
    ../../../nixos/programs/firefox.nix
    ../../../nixos/programs/steam.nix
    ../../../nixos/programs/zsh/zsh.nix
  ];
}
