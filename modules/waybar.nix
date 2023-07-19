{ config, user, ... }:

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

      #workspaces {
        background-color: #34C3A0;
      }

      #workspaces button {
        border-radius: 0;
      }

      #workspaces button.active {
        background-color: #343434;
        color: #34C3A0;
      }

      #clock,
      #custom-yubikey,
      #cpu,
      #memory,
      #disk,
      #backlight,
      #pulseaudio,
      #battery,
      #network {
        padding: 0 10px;
      }

      #clock {
        background-color: #64727D;
      }

      #custom-yubikey {
        background-color: #FFFF00;
        color: #000000;
      }

      #cpu,
      #memory,
      #disk {
        background-color: #9B59B6;
      }

      #backlight {
        background-color: #ABFC13;
      }

      #pulseaudio {
        background-color: #FFA000;
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
          "custom/yubikey"
          "cpu"
          "memory"
          "disk"
          "backlight"
          "pulseaudio"
          "battery"
          "network"
        ];

        "wlr/workspaces" = {
          format = "<span font='11'>{name}</span>";
          active-only = false;
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        clock = {
          format = "{:%d.%m.%Y - %H:%M:%S}";
          interval = 1;
        };

        "custom/yubikey" = {
          exec = "/home/${user.name}/.config/waybar/script/yubikey.sh";
          return-type = "json";
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
        backlight = {
          device = "intel_backlight";
          format = "{percent}% <span font='11'></span> ";
        };
        pulseaudio = {
          format = "{volume}% <span font='11'>{icon}</span> ";
          format-muted = "{volume}% <span font='11'>x</span>";
          format-icons = {
            default = [ "" "" "" ];
          };
        };
        battery = {
          format = "{capacity}% <span font='11'>{icon}</span> ";
          format-charging = "{capacity}% <span font='11'></span>";
          format-plugged = "{capacity}% <span font='11'></span>";
          format-icons = [ "" "" "" "" "" ];
          states = {
            critical = 28;
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

  home.file = {
    ".config/waybar/script/yubikey.sh" = {
      executable = true;
      text = ''
        #!/bin/sh

        socket="$XDG_RUNTIME_DIR/yubikey-touch-detector.socket"

        while true; do
          if [ ! -e "$socket" ]; then
            printf '{"text": "Waiting for YubiKey socket"}\n'
            while [ ! -e "$socket" ]; do sleep 1; done
          fi
          printf '{"text": ""}\n'

          nc -U "$socket" | while read -n5 cmd; do
            if [ $(echo $cmd | cut -d'_' -f2) = "1" ]; then
              printf '{"text": " "}\n'
            else
              printf '{"text": ""}\n'
            fi
          done

          sleep 1
        done
      '';
    };
  };
}
