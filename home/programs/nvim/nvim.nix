{ inputs, pkgs, lib, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
      enable = true;
    };
}
#let
#  # A little script to fetch packages from github to install.
#  fromGithub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
#    pname = "${lib.strings.sanitizeDerivationName repo}";
#    version = ref;
#    src = builtins.fetchGit {
#      url = "https://github.com/${repo}.git";
#      ref = ref;
#      rev = rev;
#    };
#  };
#in
#{
#
#  home.packages = with pkgs; [
#    # lua-language-server
#    fd
#    ripgrep
#  ];
#
#  programs.neovim = {
#    enable = true;
#    package = pkgs.neovim-unwrapped;
#    vimAlias = true;
#    coc.enable = false;
#
#    plugins = with pkgs.vimPlugins; [
#      nvim-lspconfig
#      nvim-treesitter.withAllGrammars
#      LazyVim
#      # Example
#      # (fromGitHub "6422c3a651c3788881d01556cb2a90bdff7bf002" "master" "Shopify/shadowenv.vim")
#    ];
#  };
#
#  # home.file = {
#  #   "./config/nvim" = {
#  #     source = ./config;
#  #     recursive = true;
#  #   };
#  # };
#}
