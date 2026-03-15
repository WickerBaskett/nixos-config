{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
    ./mako.nix
  ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../../dots/hyprland.conf;
  };
}
