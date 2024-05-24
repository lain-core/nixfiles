{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
		gnomeExtensions.arcmenu
		gnomeExtensions.appindicator
		gnomeExtensions.places-status-indicator
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

    "org/gnome/mutter" = {
      "edge-tiling" = true;
    };

    "org/gnome/desktop/interface" = {
      "clock-show-weekday" = true;
      "color-scheme" = "prefer-dark";
      "show-battery-percentage" = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      "natural-scroll" = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      "click-method" = "areas"; 
      "natural-scroll" = false;
      "two-finger-scrolling-enabled" = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = ":minimize,maximize,close";

    };

    "org/gtk/settings/file-chooser" = {
      "sort-directories-first" = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      "custom-keybindings" = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      "binding" = "<Control><Alt>t";
      "command" = "kgx";
      "name" = "Terminal";
    };
  };
}