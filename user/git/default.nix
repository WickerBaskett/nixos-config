{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "erlewa";
      user.email = "erlewandowski@alaska.edu";
      alias = {
        a = "add";
        aa = "add --all";
        ci = "commit -m";
        pl = "pull";
        p = "push";
        co = "checkout";
        cob = "checkout -b";
        s = "status";
        f = "fetch --prune";
        b = "branch -a";
        rh = "reset --hard";
      };
    };
  };
}
