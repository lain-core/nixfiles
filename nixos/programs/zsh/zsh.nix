{ pkgs, ... }:

{
  programs.zsh.enable = true;

  # TODO: Fix this so it is not hard-coded
  users.users.lain = {
    shell = pkgs.zsh;
  };

  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
}
