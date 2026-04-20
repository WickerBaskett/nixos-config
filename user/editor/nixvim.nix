{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;
      telescope.enable = true;      
      web-devicons.enable = true;
      lsp.enable = true;
      oil.enable = true;
      sleuth.enable = true;
      
      cmp = {
	enable = true;
	settings.sources = [
	  { name = "nvim_lsp"; }
	  { name = "path"; }
	  { name = "buffer"; }
	];
      };

      treesitter = {
      	enable = true;
	nixvimInjections = true;
	settings = {
	  highlight.enable = true;
	  indent.enable = true;
	  folding.enable = true;
	};

	grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
	  nix
	  python
	  c
	  cpp
	  bash
	  julia
	];
      };
    };

    lsp.servers = {
      nixd.enable = true;
      ty.enable = true; 
    };

    keymaps = [
      {
	mode = "n";
	key = "ff";
	action = "<cmd>Telescope find_files<CR>";
	options = {
	  desc = "Find files";
	};
      }
    ];
  };
}
