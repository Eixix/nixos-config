{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
    settings = {
      sync_to_monitor = "no";
      disable_ligatures = "never";
      enable_audio_bell = "no";
      dynamic_background_opacity = true;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      background_opacity = "0.9";
      window_padding_width = 10;
      shell_integration = "no-cursor";
    };
  };
}
