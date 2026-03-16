{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
    ./mako.nix
    ./hyprpaper.nix
  ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../../dots/hyprland.conf;
  };
}
