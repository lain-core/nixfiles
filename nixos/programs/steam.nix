{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [ pkgs.mangohud ]; # used for limiting fps via steam command parameters

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };

  # Configure for steam input.
  hardware.steam-hardware.enable = true;

  # Enable 32-bit OpenGL for Wine &c.
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
