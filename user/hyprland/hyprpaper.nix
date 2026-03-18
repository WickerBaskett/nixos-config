{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "/home/wicker/wallpapers/sunset-clouds.jpg"
        "/home/wicker/wallpapers/sunset-fishing.png"
        "/home/wicker/wallpapers/dark-firewatch.png"
        "/home/wicker/wallpapers/forest-bridge.jpg"
      ];

      wallpaper = [
        ",/home/wicker/wallpapers/forest-bridge.jpg"
      ];
    };
  };
}
