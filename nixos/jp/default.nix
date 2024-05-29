{ pkgs, config, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [
      pkgs.fcitx5-anthy
    ];

    fcitx5.settings.inputMethod = {
      "Groups/0" = {
        "Name" = "Default";
        "Default Layout" = "us";
        "DefaultIM" = "anthy";
      };

      "Groups/0/Items/0" = {
        "Name" = "keyboard-us";
        "Layout" = null;
      };

      "Groups/0/Items/1" = {
        "Name" = "anthy";
        "Layout" = "null";
      };

      "GroupOrder" = {
        "0" = "Default";
      };
    };
  };

  # Kitty only supports ibus and fcitx provides an ibus interface.
  environment.variables.GLFW_IM_MODULE = "ibus";
}
