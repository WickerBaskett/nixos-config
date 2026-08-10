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
        "/home/wicker/wallpapers/among-trees-river.jpg"
        "/home/wicker/wallpapers/mountain-lake.jpg"
      ];

      wallpaper = [
        ",/home/wicker/wallpapers/mountain-lake.jpg"
      ];
    };
  };
}
