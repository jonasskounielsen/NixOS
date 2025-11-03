{ ... }: {
  environment.variables = {
    EDITOR = "nvim";
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      vimAlias = true;
      viAlias = true;
      
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
        tabstop = 2; # TODO: differentiate between languages
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

      #theme = {
      #  enable = true;
      #  
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
