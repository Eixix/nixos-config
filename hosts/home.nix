{ config, lib, pkgs, user, keyid, ... }:

{
  imports = [
    ../modules/hyprland/home.nix
    ../modules/kitty.nix
    ../modules/git.nix
    ../modules/zsh.nix
    ../modules/waybar.nix
    ../modules/rofi/default.nix
    ../modules/gnupg.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
    };

    packages = with pkgs; [
      killall
      btop
      zip
      unzip
      tree
      bat
      exa
      usbutils

      grim
      slurp

      vim
      google-chrome
      telegram-desktop

      pamixer
      brightnessctl

      cargo
      nodejs
      clang
      wl-clipboard
      fd
      ripgrep
      tree-sitter
      neovim
    ];

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
