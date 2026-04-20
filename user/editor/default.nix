{ config, pkgs, ... }:

{
  imports =
    [ 
      ./nixvim.nix
    ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}

