{ pkgs, ... }:

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
	settings = {
	  mapping = {
	    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
	    "<CR>" = "cmp.mapping.confirm({ select = true })";
	  };
	  sources = [
	    { name = "nvim_lsp"; }
	    { name = "path"; }
	    { name = "buffer"; }
	  ];
	};
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
      clangd.enable = true;
      ty.enable = true; 
    };

    diagnostic.settings = {
      virtual_text = true;
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
      {
	mode = "n";
	key = "fo";
	action = "<cmd>Oil<CR>";
	options = {
	  desc = "Open Oil";
	};
      }
    ];
  };
}
