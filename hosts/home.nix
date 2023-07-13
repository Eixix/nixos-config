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
      window_padding_width = 10;
      shell_integration = "no-cursor";
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

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    syntaxHighlighting.enable = true;

    history.expireDuplicatesFirst = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/${user}/flake/#titania";
      n = "nvim && clear";
    };
  };
}
