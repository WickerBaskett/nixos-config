{ config, pkgs, ... }:

{
  imports =
    [ 
      ./nvf
    ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}

