{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
