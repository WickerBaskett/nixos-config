{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
  ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ../../../dots/hyprland.conf;
  };
}
