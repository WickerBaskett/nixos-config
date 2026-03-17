{ config, pkgs, ... }:

{
  imports = [ 
    ../../common/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop"; # Define your hostname.
}
