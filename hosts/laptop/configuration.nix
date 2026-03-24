{ config, pkgs, ... }:

{
  imports = [ 
    ../../common/configuration.nix
    ./hardware-configuration.nix
    ../../system/gaming
  ];
  networking.hostName = "nixos-laptop"; # Define your hostname.
}
