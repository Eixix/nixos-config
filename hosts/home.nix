{ config, lib, pkgs, user, ... }:

{
  imports = [
    ../modules/hyprland/home.nix
    ../modules/kitty.nix
    ../modules/git.nix
    ../modules/zsh.nix
    ../modules/waybar.nix
    ../modules/rofi/default.nix
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

      vim
      google-chrome

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
