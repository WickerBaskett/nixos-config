{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-forest.yaml";
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/72/wallhaven-72p97v.jpg";
      hash = "sha256-0rbgmcw6328r72vyg9hxgk1dlpwxm6h7mj4rq7czgq5mf4bqdb7r";
    };
  };
}

