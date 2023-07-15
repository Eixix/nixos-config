{
  programs.waybar = {
    enable = true;

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(43, 48, 59, 0.5);
        border-bottom: 3px solid rgba(100, 114, 125, 0.5);
        color: #FFFFFF;
      }

      #clock,
      #cpu,
      #memory,
      #disk,
      #battery,
      #network {
        padding: 0 10px;
      }

      #clock {
        background-color: #64727D;
      }

      #cpu,
      #memory,
      #disk {
        background-color: #9B59B6;
      }

      #battery {
        background-color: #2ECC71;
      }
      #battery.charging, #battery.plugged {
        background-color: #2980B9;
      }
      #battery.critical:not(.charging) {
        background-color: #F53C3C;
      }

      #network {
        background-color: #90B1B1;
      }
    '';

    settings = {
      Main = {
        layer = "top";
        position = "top";
        height = 34;
        output = "eDP-1";

        modules-left = [
          "wlr/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "cpu"
          "memory"
          "disk"
          "battery"
          "network"
        ];

        "wlr/workspaces" = {
          format = "<span font='11'>{name}</span>";
          active-only = false;
        };

        clock = {
          format = "{:%d.%m.%Y - %H:%M:%S}";
          interval = 1;
        };

        cpu = {
          format = "{usage}% <span font='11'></span>";
          interval = 1;
        };
        memory = {
          format = "{percentage}% <span font='11'></span>";
          interval = 1;
        };
        disk = {
          format = "{percentage_used}% <span font='11'></span> ";
        };
        battery = {
          format = "{capacity}% <span font='11'>{icon}</span> ";
          format-icons = [ "" "" "" "" "" ];
          states = {
            warning = 30;
            critical = 15;
          };
        };
        network = {
          format-wifi = "{ipaddr} <span font='11'></span> ";
          format-ethernet = "{ipaddr} <span font='11'></span>";
          format-disconnected = "Disconnected";
        };
      };
    };
  };
}
