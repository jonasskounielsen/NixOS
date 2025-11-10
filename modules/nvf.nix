{ pkgs, ... }: {
  environment.variables = {
    EDITOR = "nvim";
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      vimAlias = true;
      viAlias = true;
      
      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        kdl
      ];

      languages = {
        enableTreesitter = true;
        rust = {
          enable = true;
          crates = {
            enable = true;
            codeActions = true;
          };
          dap.enable = true;
        };
        nix = {
          enable = true;
          extraDiagnostics.enable = true;
          lsp.server = "nixd";
        };
        lua = {
          enable = true;
        };
        typst = {
          enable = true;
          extensions = {
            typst-concealer.enable = true;
            typst-preview-nvim.enable = true;
          };
        };
      };

      lsp = {
        enable = true;
        inlayHints.enable = true;
        lightbulb.enable = true;
        lspkind.enable = true;
        #lspsaga.enable = true;
        otter-nvim.enable = true;
        trouble.enable = true;
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      telescope.enable = true;

      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };

      options = {
        shiftwidth = 0;
        tabstop = 2;
      };

      statusline = {
        lualine.enable = true;
      };
      
      visuals = {
        nvim-scrollbar.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        indent-blankline.enable = true;
      };

      extraPlugins = with pkgs.vimPlugins; {
        melange = {
          package = melange-nvim;
          setup = "vim.cmd.colorscheme 'melange'";
        };
      };

     #theme = {
     #  enable = true;
     #  name = "base16";
     #  base16-colors = {
     #    base00 = "#191919";
     #    base01 = "#b1270e";
     #    base02 = "#44a900";
     #    base03 = "#a9810b";
     #    base04 = "#578499";
     #    base05 = "#776b53";
     #    base06 = "#b2591d";
     #    base07 = "#776b53";
     #    base08 = "#423625";
     #    base09 = "#ed5c20";
     #    base0A = "#55f237";
     #    base0B = "#f1b731";
     #    base0C = "#85cfec";
     #    base0D = "#e04b5a";
     #    base0E = "#f07c14";
     #    base0F = "#ffc800";
     #  };
     #};

      utility = {
        multicursors.enable = true;
        outline.aerial-nvim.enable = true;
        surround.enable = true;
        yazi-nvim = {
          enable = true;
          mappings = {
            openYazi = "<leader>y";
            openYaziDir = "<leader>Y";
          };
          setupOpts.open_for_directories = true;
        };
      };
    };
  };
}
