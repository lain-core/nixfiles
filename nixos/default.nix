{ pkgs, ... }:

{
  # Enable nix * instead of nix-* commands
  nix.settings.experimental-features = "nix-command flakes";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  # Networking
  networking.networkmanager.enable = true;

  # TODO: modify this
  users.users.lain = {
    isNormalUser = true;
    home = "/home/lain";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "password"; # Change on first boot
  };

  # Enable Auto-updates.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Install relevant packages.
  environment.systemPackages = with pkgs; [
    # Toolchain
    gcc
    cmake
    gnumake
    cc65
    nodenv
    pyenv
    rustup
    gcc-arm-embedded
    ffmpeg
    SDL2
    libxcrypt
    openssl

    # Development
    git
    vim
    neovim
    rpi-imager

    # Utils
    home-manager
    nil
    nixpkgs-fmt
    calc
    vlc
    ntfs3g
    wget
    curl
    p7zip

    # Misc
    sl
    google-chrome
    neofetch
  ];

  # Configure Caps-as-ctrl.
  services.xserver.xkb = {
    options = "ctrl:swapcaps";
  };
}
