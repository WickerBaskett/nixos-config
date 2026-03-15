{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  users.users.wicker.extraGroups = [ "docker" ];
}
