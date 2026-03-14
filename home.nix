{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wicker";
  home.homeDirectory = "/home/wicker";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source = ./dots/hyprland.conf;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
  
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };
  };
  
  programs.vim = {
    enable = true;
    settings = {
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
  };

  services.mako = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile dots/waybar/style.css;
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
