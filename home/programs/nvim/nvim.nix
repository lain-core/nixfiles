{ inputs, pkgs, lib, ... }:

# let
#   # A little script to fetch packages from github to install.
#   fromGithub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
#     pname = "${lib.strings.sanitizeDerivationName repo}";
#     version = ref;
#     src = builtins.fetchGit {
#       url = "https://github.com/${repo}.git";
#       ref = ref;
#       rev = rev;
#     };
#   };
# in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    xclip
    wl-clipboard
    lua-language-server
  ];

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   vimAlias = true;

  #   plugins = [
  #     pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  #   ];
  # };

  # home.file = {
  #     ".config/nvim" = {
  #     source = ./nvim;
  #     recursive = true;
  #   };
  # };

  # FIXME: This is busted as shit and fights with the lazyvim stuff.
  # It might be worth coming back to when I understand the whole nvim setup in more detail.
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # extraConfigLuaPre =
    #   "require(\"config.lazy\")";

    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
        # TODO: This needs to be enabled for devices using X11
        # xclip.enable = false;
      };
    };

    plugins = {
      lazy.enable = true;
      treesitter.enable = true;

      # Language servers to enable.
      lsp = {
        enable = true;

        servers = {
          bashls.enable = true; # Bash
          ccls.enable = true; # C/C++
          cmake.enable = true; # CMake
          cssls.enable = true; # CSS
          html.enable = true; # HTML
          jsonls.enable = true; # JSON
          lua-ls.enable = true; # Lua
          nil_ls.enable = true; # Nix
          pylsp.enable = true; # Python
          rust-analyzer = {
            enable = true;

            # Disable the installation of cargo/rustc directly, because some of the rustfmt settings may require nightly versions.
            installCargo = false;
            installRustc = false;
          }; # Rust
        };
      };

      # Language server formatting settings. 
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      # TODO: I do not know what these are but I'm stealing them from the default lazy-lock
      bufferline.enable = true;
      cmp.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      conform-nvim.enable = true;
      dashboard.enable = true;
      dressing.enable = true;
      flash.enable = true;
      friendly-snippets.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      lualine.enable = true;
      # mason-lspconfig does not apply
      # mason does not apply
      mini.enable = true;
      neo-tree.enable = true;
      # neoconf does not exist
      # neodev does not exist
      noice.enable = true;
      # nui does not exist
      # nvim-cmp is just cmp
      lint.enable = true; #nvim-lint
      # nvim-lspconfig does not exist
      notify.enable = true;
      # nvim-snippets does not exist
      spectre.enable = true;
      # Treesitter has been dealt with
      treesitter-textobjects.enable = true;
      ts-autotag.enable = true;
      # nvim-web-devicons doesn't exist
      persistence.enable = true;
      # plenary doesn't exist
      telescope.enable = true;
      todo-comments.enable = true;
      # tokyonight theme doesn't exist
      trouble.enable = true;
      ts-context-commentstring.enable = true;
      which-key.enable = true;

    };
  };
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


