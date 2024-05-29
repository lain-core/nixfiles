{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Install Firefox.
  programs.firefox = {
    enable = true;
  };
}
