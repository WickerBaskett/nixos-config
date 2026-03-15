{ config, pkgs, ... }:

{
  imports = [
    ./user/wm/hyprland
    ./user/editor
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wicker";
  home.homeDirectory = "/home/wicker";

  home.stateVersion = "25.11"; # Please read the comment before changing.

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
  
  services.mako = {
    enable = true;
  };

  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
