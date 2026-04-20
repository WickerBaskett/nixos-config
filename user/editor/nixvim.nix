{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    colorschemes.catppuccin.enable = true;
    plugins = {
      lualine.enable = true;
      telescope.enable = true;      
      web-devicons.enable = true;
      lsp.enable = true;
      oil.enable = true;
      sleuth.enable = true;
      todo-comments.enable = true;
      tinygit.enable = true;
      treesitter-context.enable = true;
      toggleterm.enable = true;
      

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
      # File Navigation
      {
	mode = "n";
	key = "<leader>ff";
	action = "<cmd>Telescope find_files<CR>";
	options = {
	  desc = "Find files";
	};
      }
      {
	mode = "n";
	key = "<leader>fo";
	action = "<cmd>Oil<CR>";
	options = {
	  desc = "Open Oil";
	};
      }

      # Terminals
      {
	mode = "n";
	key = "<leader>tt";
	action = "<cmd>ToggleTerm size=8 direction=horizontal name=desktop<CR>";
	options = {
	  desc = "Open terminal";
	};
      }	

      # Tinygit Keybinds
      {
	mode = "n";
	key = "<leader>ga";
	action = "<cmd>Tinygit interactiveStaging<CR>";
	options = {
	  desc = "Stage changes";
	};
      }
      {
	mode = "n";
	key = "<leader>gc";
	action = "<cmd>Tinygit smartCommit<CR>";
	options = {
	  desc = "Commit staged changes";
	};
      }
      {
	mode = "n";
	key = "<leader>gp";
	action = "<cmd>Tinygit push<CR>";
	options = {
	  desc = "Push changes";
	};
      }
    ];
  };
}
