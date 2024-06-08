{ pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lain";
  home.homeDirectory = "/home/lain";

  home.sessionVariables = {
    XDG_CACHE_HOME = "/home/lain/.cache";
    XDG_CONFIG_HOME = "/home/lain/.config";
    XDG_DATA_HOME = "/home/lain/.local/share";
    XDG_STATE_HOME = "/home/lain/.local/state";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;
    [
      bitwarden

      # Fun
      telegram-desktop
      discord
      yt-dlp
      deluge
      hexchat
    ];

  imports = [
    ./git.nix
    ../../de/gnome.nix
    ../../programs/kitty/kitty.nix
    ../../programs/nvim/nvim.nix
    ../../programs/tmux/tmux.nix
    ../../programs/zsh/zsh.nix
    ../../programs/vscode.nix
  ];

}
