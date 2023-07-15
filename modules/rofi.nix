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

  home.file.".config/rofi/powermenu.rasi" = {
    text = ''
      /**
       *
       * Author : Aditya Shakya (adi1090x)
       * Github : @adi1090x
       * 
       **/

      * {
        background: #1E1D2FFF;
        background-alt: #282839FF;
        foreground: #D9E0EEFF;
        selected: #7AA2F7FF;
        active: #ABE9B3FF;
        urgent: #F28FADFF;
      }

      /*****----- Configuration -----*****/
      configuration {
          show-icons:                 false;
      }

      /*
      USE_BUTTONS=YES
      */

      /*****----- Main Window -----*****/
      window {
          /* properties for window widget */
          transparency:                "real";
          location:                    center;
          anchor:                      center;
          fullscreen:                  false;
          width:                       800px;
          x-offset:                    0px;
          y-offset:                    0px;

          /* properties for all widgets */
          enabled:                     true;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          cursor:                      "default";
          background-color:            @background;
      }

      /*****----- Main Box -----*****/
      mainbox {
          enabled:                     true;
          spacing:                     15px;
          margin:                      0px;
          padding:                     30px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          children:                    [ "inputbar", "listview" ];
      }

      /*****----- Inputbar -----*****/
      inputbar {
          enabled:                     true;
          spacing:                     15px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          text-color:                  @foreground;
          children:                    [ "textbox-prompt-colon", "prompt"];
      }

      dummy {
          background-color:            transparent;
      }

      textbox-prompt-colon {
          enabled:                     true;
          expand:                      false;
          str:                         "";
          padding:                     12px 20px 12px 16px;
          border-radius:               0px;
          background-color:            @urgent;
          text-color:                  @background;
      }
      prompt {
          enabled:                     true;
          padding:                     12px;
          border-radius:               0px;
          background-color:            @active;
          text-color:                  @background;
      }

      /*****----- Message -----*****/
      message {
          enabled:                     true;
          margin:                      0px;
          padding:                     12px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background-alt;
          text-color:                  @foreground;
      }
      textbox {
          background-color:            inherit;
          text-color:                  inherit;
          vertical-align:              0.5;
          horizontal-align:            0.5;
          placeholder-color:           @foreground;
          blink:                       true;
          markup:                      true;
      }
      error-message {
          padding:                     12px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background;
          text-color:                  @foreground;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     true;
          columns:                     5;
          lines:                       1;
          cycle:                       true;
          dynamic:                     true;
          scrollbar:                   false;
          layout:                      vertical;
          reverse:                     false;
          fixed-height:                true;
          fixed-columns:               true;
          
          spacing:                     15px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          text-color:                  @foreground;
          cursor:                      "default";
      }

      /*****----- Elements -----*****/
      element {
          enabled:                     true;
          spacing:                     0px;
          margin:                      0px;
          padding:                     40px 10px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background-alt;
          text-color:                  @foreground;
          cursor:                      pointer;
      }
      element-text {
          font:                        "feather bold 32";
          background-color:            transparent;
          text-color:                  inherit;
          cursor:                      inherit;
          vertical-align:              0.5;
          horizontal-align:            0.5;
      }
      element selected.normal {
          background-color:            var(selected);
          text-color:                  var(background);
      }
    '';
  };

  home.file.".config/rofi/drun.rasi" = {
    text = ''
      /**
       *
       * Author : Aditya Shakya (adi1090x)
       * Github : @adi1090x
       * 
       **/

      * {
        background: #1E1D2FFF;
        background-alt: #282839FF;
        foreground: #D9E0EEFF;
        selected: #7AA2F7FF;
        active: #ABE9B3FF;
        urgent: #F28FADFF;
      }

      /*****----- Configuration -----*****/
      configuration {
        modi:                       "drun";
          show-icons:                 true;
          display-drun:               "Applications";
        drun-display-format:        "{name}";
      }

      /*****----- Main Window -----*****/
      window {
          transparency:                "real";
          location:                    center;
          anchor:                      center;
          fullscreen:                  false;
          width:                       800px;
          x-offset:                    0px;
          y-offset:                    0px;

          enabled:                     true;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background;
          cursor:                      "default";
      }

      /*****----- Main Box -----*****/
      mainbox {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     30px;
          border:                      0px solid;
          border-radius:               0px 0px 0px 0px;
          border-color:                @selected;
          background-color:            transparent;
          children:                    [ "inputbar", "listview" ];
      }

      /*****----- Inputbar -----*****/
      inputbar {
          enabled:                     true;
          spacing:                     0px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background-alt;
          text-color:                  @foreground;
          children:                    [ "prompt", "entry" ];
      }

      prompt {
          enabled:                     true;
          padding:                     12px;
          background-color:            @selected;
          text-color:                  @background;
      }
      textbox-prompt-colon {
          enabled:                     true;
          expand:                      false;
          str:                         "::";
          background-color:            inherit;
          text-color:                  inherit;
      }
      entry {
          enabled:                     true;
          padding:                     12px;
          background-color:            inherit;
          text-color:                  inherit;
          cursor:                      text;
          placeholder:                 "Search...";
          placeholder-color:           inherit;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     true;
          columns:                     2;
          lines:                       10;
          cycle:                       true;
          dynamic:                     true;
          scrollbar:                   false;
          layout:                      vertical;
          reverse:                     false;
          fixed-height:                true;
          fixed-columns:               true;
          
          spacing:                     10px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            transparent;
          text-color:                  @foreground;
          cursor:                      "default";
      }
      scrollbar {
          handle-width:                5px ;
          handle-color:                @selected;
          border-radius:               0px;
          background-color:            @background-alt;
      }

      /*****----- Elements -----*****/
      element {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     5px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background;
          text-color:                  @foreground;
          cursor:                      pointer;
      }
      element normal.normal {
          background-color:            @background-alt;
          text-color:                  @foreground;
      }
      element alternate.normal {
          background-color:            @background-alt;
          text-color:                  @foreground;
      }
      element selected.normal {
          border:                      0px 0px 0px 4px;
          border-color:                @selected;
          background-color:            @background-alt;
          text-color:                  @selected;
      }
      element-icon {
          padding:                     0px 0px 0px 10px;
          background-color:            transparent;
          text-color:                  inherit;
          size:                        32px;
          cursor:                      inherit;
      }
      element-text {
          background-color:            transparent;
          text-color:                  inherit;
          highlight:                   inherit;
          cursor:                      inherit;
          vertical-align:              0.5;
          horizontal-align:            0.0;
      }

      /*****----- Message -----*****/
      error-message {
          padding:                     15px;
          border:                      2px solid;
          border-radius:               0px;
          border-color:                @selected;
          background-color:            @background;
          text-color:                  @foreground;
      }
      textbox {
          background-color:            @background;
          text-color:                  @foreground;
          vertical-align:              0.5;
          horizontal-align:            0.0;
          highlight:                   none;
      }
    '';
  };
  
  home.file.".config/rofi/power.sh" = {
    executable = true;
    text = ''
      # Author : Aditya Shakya (adi1090x)
      # Github : @adi1090x

      uptime="`uptime | cut -d ' ' -f2`"
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
}
