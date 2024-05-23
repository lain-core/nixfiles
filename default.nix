{ pkgs, ... }:

{
    imports = [
        ./home/lain
    ];
    # Enable nix * instead of nix-* commands
    nix.settings.experimental-features = "nix-command flakes";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "23.11";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

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
        neovim

        # Misc
        bitwarden
        ntfs3g
        vlc
        calc
        sl
    ];

    # Configure for steam input.
    hardware.steam-hardware.enable=true;

    # Enable 32-bit OpenGL for Wine &c.
    hardware.opengl.driSupport32Bit=true;
}
