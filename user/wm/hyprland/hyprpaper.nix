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
      ];

      wallpaper = [
        ",/home/wicker/wallpapers/sunset-clouds.jpg"
      ];
    };
  };
}
