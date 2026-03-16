{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    rofi
    mako
    hyprpaper
  ];

  # Install nerd fonts
  fonts.packages = [ pkgs.jetbrains-mono ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.pipewire.enable = true;
}
