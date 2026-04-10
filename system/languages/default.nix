{ config, pkgs, ... }:

{
  imports = [
    ./python.nix
  ];
  
  environment.systemPackages = with pkgs; [
    clang 
  ];
}
