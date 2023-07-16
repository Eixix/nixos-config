{ config, lib, pkgs, host, user, ... }:

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

    bind = SUPER, Return, exec, ${pkgs.kitty}/bin/kitty
    bind = SUPERSHIFT, C, killactive,
    bind = SUPER, Space, exec, ${pkgs.rofi}/bin/rofi -show drun -theme drun -show-icons
    bind = SUPER, B, exec, ${pkgs.google-chrome}/bin/google-chrome-stable
    bind = SUPER, Escape, exec, /home/${user}/.config/rofi/power.sh

    bind = , Print, exec, grim - | wl-copy
    bind = CONTROL, Print, exec, grim
    bind = SUPER, Print, exec, grim -g "$(slurp)" - | wl-copy
    bind = SUPERCONTROL, Print, exec, grim -g "$(slurp)"

    bind = SUPER, h, movefocus, l
    bind = SUPER, j, movefocus, d
    bind = SUPER, k, movefocus, u
    bind = SUPER, l, movefocus, r

    bind = SUPERSHIFT, h, movewindow, l
    bind = SUPERSHIFT, j, movewindow, d
    bind = SUPERSHIFT, k, movewindow, u
    bind = SUPERSHIFT, l, movewindow, r

    bind = SUPERCONTROL, h, workspace, r-1
    bind = SUPERCONTROL, l, workspace, r+1

    bind = SUPER, 1, workspace, 1
    bind = SUPER, 2, workspace, 2
    bind = SUPER, 3, workspace, 3
    bind = SUPER, 4, workspace, 4
    bind = SUPER, 5, workspace, 5
    bind = SUPER, 6, workspace, 6
    bind = SUPER, 7, workspace, 7
    bind = SUPER, 8, workspace, 8
    bind = SUPER, 9, workspace, 9
    bind = SUPER, 0, workspace, 0

    bind = SUPERSHIFT, 1, movetoworkspace, 1
    bind = SUPERSHIFT, 2, movetoworkspace, 2
    bind = SUPERSHIFT, 3, movetoworkspace, 3
    bind = SUPERSHIFT, 4, movetoworkspace, 4
    bind = SUPERSHIFT, 5, movetoworkspace, 5
    bind = SUPERSHIFT, 6, movetoworkspace, 6
    bind = SUPERSHIFT, 7, movetoworkspace, 7
    bind = SUPERSHIFT, 8, movetoworkspace, 8
    bind = SUPERSHIFT, 9, movetoworkspace, 9
    bind = SUPERSHIFT, 0, movetoworkspace, 0

    bind=,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
    bind=,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
    bind=,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
    bind=,XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl set 10%-
    bind=,XF86MonBrightnessUP,exec,${pkgs.brightnessctl}/bin/brightnessctl set +10%

    exec = hyprpaper
    exec-once = ${pkgs.waybar}/bin/waybar
  '';

  hyprPath = "/home/${user}/.config/hypr";

  hyprpaperConf = ''
    preload = ${hyprPath}/wallpaper.jpg
    wallpaper = ,${hyprPath}/wallpaper.jpg
  '';
in
{
  home.file = {
    "${hyprPath}/hyprland.conf".text = hyprlandConf;
    "${hyprPath}/hyprpaper.conf".text = hyprpaperConf;
    "${hyprPath}/wallpaper.jpg".source = config.lib.file.mkOutOfStoreSymlink /home/${user}/flake/modules/hyprland/yosemite-lowpoly.jpg;
  };

  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000f0";
      font-size = "24";
      indicator-idle-visible = false;
      indicator-radius = 100;
      indicator-thickness = 20;
      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      key-hl-color = "79b360";
      line-color = "000000f0";
      line-clear-color = "000000f0";
      line-ver-color = "000000f0";
      line-wrong-color = "000000f0";
      ring-color = "ffffff50";
      ring-clear-color = "bbbbbb50";
      ring-ver-color = "bbbbbb50";
      ring-wrong-color = "b3606050";
      text-color = "ffffff";
      text-ver-color = "ffffff";
      text-wrong-color = "ffffff";
      show-failed-attempts = true;
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f"; }
    ];
  };
}
