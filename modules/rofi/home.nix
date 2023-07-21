{ config, location, ... }:

{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 14";
    cycle = true;
    location = "left";
    extraConfig = {
      modi = "drun";
      kb-element-next = "Control+j";
      kb-element-prev = "Control+k";
      kb-accept-entry = "Return";
      kb-remove-to-eol = "";
    };
  };

  home.file = {
    ".config/rofi/powermenu.rasi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${location}/modules/rofi/powermenu.rasi";
    };

    ".config/rofi/drun.rasi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${location}/modules/rofi/drun.rasi";
    };

    ".config/rofi/power.sh" = {
      executable = true;
      text = ''
        # Author : Aditya Shakya (adi1090x)
        # Github : @adi1090x

        uptime="`uptime | cut -d ' ' -f7 | sed -e 's/,//'`"
        host=`hostname`

        echo $uptime

        # Options
        shutdown=''
        reboot=''
        lock=''
        suspend=''
        logout=''
        yes=''
        no=''

        # Rofi CMD
        rofi_cmd() {
          rofi -dmenu \
            -p "Uptime: $uptime" \
            -mesg "Uptime: $uptime" \
            -theme powermenu
        }

        # Confirmation CMD
        confirm_cmd() {
          rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
            -theme-str 'mainbox {children: [ "message", "listview" ];}' \
            -theme-str 'listview {columns: 2; lines: 1;}' \
            -theme-str 'element-text {horizontal-align: 0.5;}' \
            -theme-str 'textbox {horizontal-align: 0.5;}' \
            -dmenu \
            -p 'Confirmation' \
            -mesg 'Are you Sure?' \
            -theme powermenu
        }

        # Ask for confirmation
        confirm_exit() {
          echo -e "$yes\n$no" | confirm_cmd
        }

        # Pass variables to rofi dmenu
        run_rofi() {
          echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
        }

        # Execute Command
        run_cmd() {
          selected="$(confirm_exit)"
          if [[ "$selected" == "$yes" ]]; then
            if [[ $1 == '--shutdown' ]]; then
              systemctl poweroff
            elif [[ $1 == '--reboot' ]]; then
              systemctl reboot
            elif [[ $1 == '--suspend' ]]; then
              systemctl suspend
              swaylock
            elif [[ $1 == '--logout' ]]; then
              loginctl terminate-session self
            fi
          else
            exit 0
          fi
        }

        # Actions
        chosen="$(run_rofi)"
        case $chosen in
            $shutdown)
            run_cmd --shutdown
                ;;
            $reboot)
            run_cmd --reboot
                ;;
            $lock)
            swaylock
                ;;
            $suspend)
            run_cmd --suspend
                ;;
            $logout)
            run_cmd --logout
                ;;
        esac
      '';
    };
  };
}
