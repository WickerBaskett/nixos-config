{ config, pkgs, ... }:

{
  imports = [
    ../user/hyprland
    ../user/editor
    ../user/git
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wicker";
  home.homeDirectory = "/home/wicker";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      "dcup" = "docker compose down; docker compose build; docker compose up";
    };
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
