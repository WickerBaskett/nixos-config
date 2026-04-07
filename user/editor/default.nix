{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp.enable = true;

        utility = {
          sleuth.enable = true; 
          oil-nvim.enable = true;
          oil-nvim.gitStatus.enable = true;
        };
        statusline.lualine.enable = true;
        telescope = {
          enable = true;
          mappings = {
            findFiles = "ff";
            treesitter = "fs";
            gitBranches = "fvb";
            gitCommits = "fvw";
            gitStatus = "fvs";
          };
        };
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          clang.enable = true;
        };
      };
    };
  };
}

