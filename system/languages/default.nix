{ config, pkgs, ... }:

{
  imports = [
    ./python.nix
  ];
  
  environment.systemPackages = with pkgs; [
    clang 
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
    ];
  };
}
