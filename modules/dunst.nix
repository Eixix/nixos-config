{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font 8";
        frame_color = "#89B4FA";
        separator_color = "frame";
        offset = "10x10";
      };
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6FA";
      };
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6FA";
      };
      urgency_critical = {
        background = "#1E1E2E";
        foreground = "#CDD6FA";
        frame_color = "#FAB387";
      };
      skip-rule = {
        appname = "yubikey-touch-detector";
        skip_display = true;
        skip_history = true;
      };
    };
  };
}
