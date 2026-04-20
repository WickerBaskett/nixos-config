{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      pkgs.vimPlugins.telescope-nvim
#      pkgs.vimPlugins.lualine-nvim
      pkgs.vimPlugins.nvim-cmp
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
	p.nix
	p.python
      ]))
    ];
    extraConfig = ''
      nnoremap ff :Telescope find_files<CR>
    '';
  };
}
