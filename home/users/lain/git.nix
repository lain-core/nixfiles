{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "lain";
    userEmail = "hking0036@gmail.com";
    ignores = [
      "*.nix"
      "*.lock"
      ".vscode/"
    ];
    extraConfig = {
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
    };
  };
}
