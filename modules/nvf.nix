{ ... }: {
  programs.nvf = {
    enable = true;
    settings = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
      vim = {
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
        };
        
        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };

        options = {
          shiftwidth = 0;
        };

        #theme = {
        #  enable = true;
        #  
        #};

        utility = {
          multicursors.enable = true;
          outline.aerial-nvim.enable = true;
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
  };
}