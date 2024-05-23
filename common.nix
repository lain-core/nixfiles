{ config, pkgs, ... }:

{
    # Enable flatpak.
    services.flatpak.enable = true;

    # Enable nix * instead of nix-* commands
    nix.settings.experimental-features = "nix-command flakes";
    
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
        (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
                rust-lang.rust-analyzer
                ms-vscode.cpptools
                ms-python.python
                bbenoist.nix
                jnoortheen.nix-ide
                ms-vscode.hexeditor
            ];
        })
        neovim
        
        # Fun
        steam
        telegram-desktop
        discord
        yt-dlp

        # Misc
        bitwarden
        ntfs3g
        vlc
        deluge
        calc
        sl
    ];

    # Configure for steam input.
    hardware.steam-hardware.enable=true;

    # Enable 32-bit OpenGL for Wine &c.
    hardware.opengl.driSupport32Bit=true;
}
