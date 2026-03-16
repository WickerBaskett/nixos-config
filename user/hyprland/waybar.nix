{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
        border: none;
        border-radius: 5px;
        font-family: Cartograph CF Nerd Font, monospace;
        font-weight: bold;
        font-size: 16px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(21, 18, 27, 255);
        color: #cdd6f4;
      }

      #workspaces button.active {
        color: #9ccfd8;
      }

      #workspaces button.focused {
        color: #9ccfd8;
      }

    ''; 
    settings = [{
      layer = "top";
      position = "top";
      mode = "dock";
      margin-left = 4;
      margin-right = 4;
      margin-top = 4;
      spacing = 12;
      fixed-center = true;
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      modules-left = [
        "custom/nixos"
        "cpu"
        "memory"
      ];
      modules-center = [ "hyprland/workspaces" ];
      modules-right = [
        "network"
        "pulseaudio"
        "clock"
      ];
      "wlr/workspaces" = {
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
        all-outputs = true;
        on-click = "activate";
      };
      cpu = {
        interval = 10;
        format = "󰻠 {}%";
        max-length = 10;
        on-click = "";
      };
      memory = {
        interval = 30;
        format = " {}%";
        format-alt = " {used:0.1f}G";
        max-length = 10;
      };
      backlight = {
        format = "󰖨 {}";
        device = "intel_backlight";
      };
      tray = {
        icon-size = 13;
        tooltip = false;
        spacing = 10;
      };
      network = {
        format = "󰖩 {essid}";
        format-disconnected = "󰖪 disconnected";
      };
      clock = {
        format = "{:%a %Y-%m-%d %I:%M:%S %p}  ";
        interval = 1;
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        tooltip = false;
        format-muted = " Muted";
        on-click = "pamixer -t";
        on-scroll-up = "pamixer -i 5";
        on-scroll-down = "pamixer -d 5";
        scroll-step = 5;
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
      };
      "pulseaudio#microphone" = {
        format = "{format_source}";
        tooltip = false;
        format-source = " {volume}%";
        format-source-muted = " Muted";
        on-click = "pamixer --default-source -t";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
        scroll-step = 5;
      };
      "custom/nixos" = {
        format = "<span foreground='#7EBAE4'> </span>";
        interval = "once";
      };
    }];
  };
}
