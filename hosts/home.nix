{ config, lib, pkgs, user, ... }:

{
  imports = [
    ../modules/hyprland/home.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      btop
      firefox
      zip
      unzip
      tree
      cargo

      fd
      ripgrep
      tree-sitter
      neovim
    ];

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

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
    };
  };

  programs.git = {
    enable = true;
    userName = "Michael Strobel";
    userEmail = "mstrobel97@gmail.com";
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };
}
