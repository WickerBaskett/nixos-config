{ config, pkgs, ... }:

{
  programs.git = {
    alias = {
      ci = "commit -m";
      p = "pull";
      ph = "push";
      co = "checkout";
      cob = "checkout -b";
      s = "status";
      f = "fetch --prune";
      rh = "reset --hard";
    };
  };
}
