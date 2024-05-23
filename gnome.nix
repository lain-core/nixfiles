{ config, pkgs, ... }:
{
    # Enable the X11 windowing system.
    # services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

	environment.systemPackages = [
		pkgs.gnomeExtensions.dash-to-dock
		pkgs.gnomeExtensions.arcmenu
		pkgs.gnomeExtensions.appindicator
		pkgs.gnomeExtensions.places-status-indicator
	]; 
  	
    environment.gnome.excludePackages = with pkgs.gnome; [
        totem
        cheese
        epiphany
        simple-scan
        yelp
        evince
        geary
        seahorse
        gnome-calendar
        gnome-contacts
        gnome-maps
        gnome-weather
        gnome-music
	];

    services.xserver.desktopManager.gnome = {
        extraGSettingsOverrides = ''
        # Enable Window Snapping
        [org.gnome.mutter]
        edge-tiling=true

        [org.gnome.shell]
        favorite-apps=['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop', 'code.desktop', 'discord.desktop', 'steam.desktop', 'org.telegram.desktop.desktop']
        '';

        extraGSettingsOverridePackages = [
            pkgs.gnome.mutter
            pkgs.gnome.gnome-shell
        ];
    };
}
