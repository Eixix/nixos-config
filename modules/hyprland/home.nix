{ config, pkgs, host, user, location, ... }:

let
  touchpad = with host;
    if hostName == "titania" then ''
      touchpad {
        natural_scroll = true
        tap-to-click = true
      }
    '' else "";

  hyprlandConf = ''
    monitor = , 1920x1080@60, 0x0, 1

    input {
      kb_layout = de
      kb_options = caps:swapescape
      numlock_by_default = 1

      ${touchpad}
    }

    general {
      border_size = 2
      gaps_in = 5
      gaps_out = 7
      layout = master
    }

    animations {
      enabled = yes
      bezier = myBezier, 0.1, 0.7, 0.1, 1.05
      animation = fade, 1, 7, default
      animation = windows, 1, 7, myBezier
      animation = windowsOut, 1, 3, default, popin 60%
      animation = windowsMove, 1, 7, myBezier
    }

    decoration {
      rounding = 0
    }

    windowrule = float, ^(powermenu)$
    windowrule = size 200 200, ^(powermenu)$
    windowrule = center, ^(powermenu)$
    bind = SUPER, Escape, exec, kitty --class powermenu powermenu

    windowrule = float, ^(passwordstoremenu)$
    windowrule = size 200 400, ^(passwordstoremenu)$
    windowrule = center, ^(passwordstoremenu)$
    bind = SUPER, P, exec, kitty --class passwordstoremenu passwordstoremenu

    bind = SUPER, Return, exec, ${pkgs.kitty}/bin/kitty
    bind = SUPERSHIFT, C, killactive,
    bind = SUPER, Space, exec, ${pkgs.rofi}/bin/rofi -show drun -theme drun -show-icons
    bind = SUPER, B, exec, ${pkgs.google-chrome}/bin/google-chrome-stable

    bind = , Print, exec, /home/${user.name}/.config/hypr/screenshot.sh clip
    bind = CONTROL, Print, exec, /home/${user.name}/.config/hypr/screenshot.sh
    bind = SUPER, Print, exec, /home/${user.name}/.config/hypr/screenshot.sh clip area
    bind = SUPERCONTROL, Print, exec, /home/${user.name}/.config/hypr/screenshot.sh area

    bind = SUPERCONTROL, Space, exec, playerctl -p spotify play-pause
    bind = SUPERCONTROL, j, exec, playerctl -p spotify next
    bind = SUPERCONTROL, k, exec, playerctl -p spotify previous
    bind = SUPERCONTROL, h, exec, playerctl -p spotify volume 0.1-
    bind = SUPERCONTROL, l, exec, playerctl -p spotify volume 0.1+

    bind = SUPER, h, movefocus, l
    bind = SUPER, j, movefocus, d
    bind = SUPER, k, movefocus, u
    bind = SUPER, l, movefocus, r

    bind = SUPERSHIFT, h, movewindow, l
    bind = SUPERSHIFT, j, movewindow, d
    bind = SUPERSHIFT, k, movewindow, u
    bind = SUPERSHIFT, l, movewindow, r

    bind = SUPER, 1, workspace, 1
    bind = SUPER, 2, workspace, 2
    bind = SUPER, 3, workspace, 3
    bind = SUPER, 4, workspace, 4
    bind = SUPER, 5, workspace, 5

    bind = SUPERSHIFT, 1, movetoworkspace, 1
    bind = SUPERSHIFT, 2, movetoworkspace, 2
    bind = SUPERSHIFT, 3, movetoworkspace, 3
    bind = SUPERSHIFT, 4, movetoworkspace, 4
    bind = SUPERSHIFT, 5, movetoworkspace, 5

    bind=,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
    bind=,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
    bind=,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
    bind=,XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl set 10%-
    bind=,XF86MonBrightnessUP,exec,${pkgs.brightnessctl}/bin/brightnessctl set +10%

    exec = hyprpaper
    exec-once = ${pkgs.waybar}/bin/waybar
    exec-once = hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}
  '';

  hyprpaperConf = ''
    preload = /home/${user.name}/.config/hypr/wallpaper.jpg
    wallpaper = ,/home/${user.name}/.config/hypr/wallpaper.jpg
  '';
in
{
  home.file = {
    ".config/hypr/hyprland.conf" = {
      text = hyprlandConf;
    };

    ".config/hypr/hyprpaper.conf" = {
      text = hyprpaperConf;
    };

    ".config/hypr/wallpaper.jpg" = {
      source = config.lib.file.mkOutOfStoreSymlink "${location}/modules/hyprland/yosemite-lowpoly.jpg";
    };

    ".config/hypr/screenshot.sh" = {
      executable = true;
      text = ''
        #!/bin/sh

        clip=0
        area=0

        for arg in "$@"
        do
          case $arg in
            clip)
              clip=1
              ;;
            area)
              area=1
              ;;
          esac
        done

        if [ $clip -eq 1 ]; then
          if [ $area -eq 1 ]; then
            grim -g "$(slurp)" - | wl-copy
          else
            grim - | wl-copy
          fi
          dunstify Screenshot "saved to clipboard"
        else
          dir=/home/${user.name}/Pictures
          [[ -d $dir ]] || mkdir $dir

          filename=$dir/$(date +'%Y-%m-%d_%H:%M:%S_grim.png')

          if [ $area -eq 1 ]; then
            grim -g "$(slurp)" $filename
          else
            grim $filename
          fi
          dunstify Screenshot "saved to $filename"
        fi
      '';
    };
  };
}
