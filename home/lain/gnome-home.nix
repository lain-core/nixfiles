{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
		gnomeExtensions.arcmenu
		gnomeExtensions.appindicator
		gnomeExtensions.places-status-indicator
    gnome.gnome-tweaks
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      "disabled-extensions" = [];
      "enabled-extensions" = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "arcmenu@arcmenu.com"
        "dash-to-dock@micxgx.gmail.com"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
      ];
      "favorite-apps" = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "code.desktop"
        "steam.desktop"
        "discord.desktop"
        "org.telegram.desktop.desktop"
      ];
    };
  };
}