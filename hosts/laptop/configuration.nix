{ config, pkgs, ... }:

{
  imports = [ 
    ../../common/configuration.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos-laptop"; # Define your hostname.
}
