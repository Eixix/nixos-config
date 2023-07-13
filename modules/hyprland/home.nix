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
    bind = SUPER, D, exec, ${pkgs.wofi}/bin/wofi --show drun
    bind = SUPER, B, exec, ${pkgs.firefox}/bin/firefox
    bind = SUPER, Escape, exec, /home/${user}/.config/wofi/power.sh

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
  '';
in
{
  home.file."/home/${user}/.config/hypr/hyprland.conf".text = hyprlandConf;
}
