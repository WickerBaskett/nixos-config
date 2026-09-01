{ config, pkgs, ... }:
let
  mountainLake = builtins.fetchurl {
    url="https://i.redd.it/n1ci0trfgrey.jpg";
    sha256 = "49c8281e2c55fb2e4efce9598c1892421e7befc86e312e82822a3afe6d2e7a57";
    name = "mountain-lake.jpg"; 
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "${mountainLake}"
      ];

      wallpaper = {
        monitor = "";
        path = "${mountainLake}";
        fit_mode = "cover";
      };
    };
  };
}
