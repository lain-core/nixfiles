{ config, pkgs, ... }:
{
  users.users.lain = {
    isNormalUser = true;
    home = "/home/lain";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}