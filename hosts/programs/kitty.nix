{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Jetbrains Mono";
      size = 14;
    };
    settings = {
      sync_to_monitor = "no";
      disable_ligatures = "never";
      enable_audio_bell = "no";
      dynamic_background_opacity = true;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      background_opacity = 0.9;
    };
  };
}
