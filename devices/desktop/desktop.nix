{ config, pkgs, ... }:

{
	imports = [
		./configuration.nix
	];

	services.xserver.videoDrivers = [ "nvidia" ];

	networking.interfaces.eth0.ipv4.addresses = [ {
		address = "192.168.1.111";
		prefixLength = 24;
	} ];

	networking.defaultGateway = "192.168.1.1";
	networking.nameservers = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];

	# Pin in this: https://nixos.org/manual/nixos/stable/#sec-weechat

	nix.gc.automatic = true;
	nix.gc.dates = "00:00";
}
