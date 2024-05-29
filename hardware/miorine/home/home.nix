{ config, pkgs, ... }:

{
  imports = [
    ../../../home/users/lain/home.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      "scaling-factor" = "1.25";
    };
  };
}
