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
  	];
}
