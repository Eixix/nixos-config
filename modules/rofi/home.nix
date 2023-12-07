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
    ".config/rofi/drun.rasi" = {
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
  };
}
