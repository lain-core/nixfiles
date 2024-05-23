{ inputs, pkgs, ... }:

{
    imports = [
        ./home/lain
    ];
    # Enable nix * instead of nix-* commands
    nix.settings.experimental-features = "nix-command flakes";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "23.11";

    nixpkgs.config.allowUnfree = true;

    # Networking
    networking.networkmanager.enable = true;

    # Enable flatpak.
    services.flatpak.enable = true;

    # XDG settings for flatpak that should be set if NOT using GNOME.
    # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    # xdg.portal.config.common.default = "gtk";

    # Install Firefox.
    programs.firefox.enable = true;

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
        
        # Development
        git
        vim
        neovim

        # Utils
        calc
        vlc
        ntfs3g
        wget
        curl
        
        # Misc
        sl
    ];

    # Configure for steam input.
    hardware.steam-hardware.enable=true;

    # Enable 32-bit OpenGL for Wine &c.
    hardware.opengl.driSupport32Bit=true;
}
