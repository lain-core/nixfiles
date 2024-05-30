{ inputs, pkgs, lib, ... }:

let
  # A little script to fetch packages from github to install.
  fromGithub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
    };
  };
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    xclip
    wl-clipboard
    lua-language-server
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  home.file = {
      ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };

  # FIXME: This is busted as shit and fights with the lazyvim stuff.
  # It might be worth coming back to when I understand the whole nvim setup in more detail.
  # programs.nixvim = {
  #   enable = true;
  #   defaultEditor = true;

  #   extraConfigLuaPre =
  #     "require(\"config.lazy\")";

  #   clipboard = {
  #     register = "unnamedplus";
  #     providers = {
  #       wl-copy.enable = true;
  #       # TODO: This needs to be enabled for devices using X11
  #       # xclip.enable = false;
  #     };
  #   };

  #   plugins = {

  #     # Language server formatting settings. 
  #     lsp-format = {
  #       enable = true;

  #       lspServersToEnable = "all";
  #     };

  #     lazy.enable = true;
  #     treesitter.enable = true;

  #     # Language servers to enable.
  #     lsp = {
  #       enable = true;

  #       servers = {
  #         bashls.enable = true; # Bash
  #         ccls.enable = true; # C/C++
  #         cmake.enable = true; # CMake
  #         cssls.enable = true; # CSS
  #         html.enable = true; # HTML
  #         jsonls.enable = true; # JSON
  #         lua-ls.enable = true; # Lua
  #         nil_ls.enable = true; # Nix
  #         pylsp.enable = true; # Python
  #         rust-analyzer = {
  #           enable = true;

  #           # Disable the installation of cargo/rustc directly, because some of the rustfmt settings may require nightly versions.
  #           installCargo = false;
  #           installRustc = false;
  #         }; # Rust
  #       };
  #     };
  #   };

  #   # extraPlugins = [
  #   #   (pkgs.vimUtils.buildVimPlugin {
  #   #     name = "format-on-save";
  #   #     src = pkgs.fetchFromGitHub {
  #   #       owner = "elentok";
  #   #       repo = "format-on-save.nvim";
  #   #       rev = "fed870bb08d9889580f5ca335649da2074bd4b6f";
  #   #       hash = "sha256-07RWMrBDVIH3iGgo2RcNDhThSrR/Icijcd//MOnBzpA=";
  #   #     };
  #   #   })
  #   # ];
  # };
}


