{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      "enable_audio_bell" = true;
      "background_opacity" = "0.7";
    };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  dconf.settings =
    {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        "binding" = "<Control><Alt>t";
        "command" = "kitty";
        "name" = "Terminal";
      };
    };

}
