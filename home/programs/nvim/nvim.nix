{ inputs, lib, pkgs, ... }:

# Trying to hack https://github.com/azuwis/lazyvim-nixvim/tree/master
# back into a regular .nix file
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs;
      [
        # LazyVim
        lua-language-server
        stylua
        # Telescope
        ripgrep

      ];

    # plugins = {

    #   # Plugins inherited from LazyVim
    #   lazy.enable = true;

    #   # FIXME: When enabled through nixvim, produces an error about tbl_add_reverse_lookup
    #   # bufferline.enable = true;
    #   cmp-buffer.enable = true;
    #   cmp-path.enable = true;
    #   cmp_luasnip.enable = true;
    #   conform-nvim.enable = true;
    #   dashboard.enable = true;
    #   dressing.enable = true;
    #   flash.enable = true;
    #   friendly-snippets.enable = true;
    #   gitsigns.enable = true;
    #   indent-blankline.enable = true;

    #   # FIXME: When enabled through nixvim, produces lua/lualine/themes/gruvbox/init.lua not found error
    #   # lualine.enable = true;
    #   neo-tree.enable = true;

    #   # FIXME: When enabled through nixvim, dumps out a log with <Function 1> repeatedly
    #   # noice.enable = true;
    #   cmp.enable = true; # as nvim-cmp regularly
    #   lint.enable = true; # as nvim-lint regularly
    #   notify.enable = true;
    #   spectre.enable = true;

    #   # FIXME: treesitter-context produces error:
    #   #   treesitter-context.context not found in luijit-2.1-1693350652-env/share/...
    #   # treesitter.enable = true;
    #   # treesitter-context.enable = true;
    #   # treesitter-textobjects.enable = true;
    #   # ts-autotag.enable = true;
    #   # ts-context-commentstring.enable = true;

    #   persistence.enable = true;
    #   telescope = {
    #     enable = true;
    #     extensions = {
    #       fzf-native.enable = true;
    #     };
    #   };
    #   todo-comments.enable = true;
    #   trouble.enable = true;
    #   which-key.enable = true;

    #   mini = {
    #     enable = true;
    #     modules = {
    #       ai = { };
    #       bufremove = { };
    #       comment = { };
    #       indentscope = { };
    #       pairs = { };
    #       surround = { };
    #     };
    #   };
    # };

    extraPlugins = [ pkgs.vimPlugins.lazy-nvim ];

    extraConfigLua =
      let
        plugins = with pkgs.vimPlugins; [
          # LazyVim
          LazyVim
          bufferline-nvim
          cmp-buffer
          cmp-nvim-lsp
          cmp-path
          cmp_luasnip
          conform-nvim
          dashboard-nvim
          dressing-nvim
          flash-nvim
          friendly-snippets
          gitsigns-nvim
          indent-blankline-nvim
          lualine-nvim
          neo-tree-nvim
          neoconf-nvim
          neodev-nvim
          noice-nvim
          nui-nvim
          nvim-cmp
          nvim-lint
          nvim-lspconfig
          nvim-notify
          nvim-spectre
          nvim-treesitter
          nvim-treesitter-context
          nvim-treesitter-textobjects
          nvim-ts-autotag
          nvim-ts-context-commentstring
          nvim-web-devicons
          persistence-nvim
          plenary-nvim
          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          tokyonight-nvim
          trouble-nvim
          vim-illuminate
          vim-startuptime
          which-key-nvim
          { name = "LuaSnip"; path = luasnip; }
          { name = "catppuccin"; path = catppuccin-nvim; }
          { name = "mini.ai"; path = mini-nvim; }
          { name = "mini.bufremove"; path = mini-nvim; }
          { name = "mini.comment"; path = mini-nvim; }
          { name = "mini.indentscope"; path = mini-nvim; }
          { name = "mini.pairs"; path = mini-nvim; }
          { name = "mini.surround"; path = mini-nvim; }
        ];
        mkEntryFromDrv = drv:
          if lib.isDerivation drv then
            { name = "${lib.getName drv}"; path = drv; }
          else
            drv;
        lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
      in
      ''
        require("lazy").setup({
          defaults = {
            lazy = true,
          },
          dev = {
            -- reuse files from pkgs.vimPlugins.*
            path = "${lazyPath}",
            patterns = { "." },
            -- fallback to download
            fallback = true,
          },
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            -- The following configs are needed for fixing lazyvim on nix
            -- force enable telescope-fzf-native.nvim
            { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
            -- disable mason.nvim, use config.extraPackages
            { "williamboman/mason-lspconfig.nvim", enabled = false },
            { "williamboman/mason.nvim", enabled = false },
            -- uncomment to import/override with your plugins
            -- { import = "plugins" },
            -- put this line at the end of spec to clear ensure_installed
            { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
          },
        })
      '';

  };
}
