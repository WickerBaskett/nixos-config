{ config, pkgs, ... }:

{
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
        
        treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          nix
          c
          python
          julia
          bash
        ];

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          clang.enable = true;
          python.enable = true;
          julia.enable = true;
          bash.enable = true;
        };
      };
    };
  };
}
