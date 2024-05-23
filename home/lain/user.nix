{ config, ... }:
{
  # imports = [
  #   ../home.nix
  # ];

  users.users.lain = {
    isNormalUser = true;
    home = "/home/lain";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}