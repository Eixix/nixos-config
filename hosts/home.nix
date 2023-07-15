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

    packages = with pkgs; [
      btop
      firefox
      zip
      unzip
      tree
      cargo
      bat
      exa

      pamixer
      brightnessctl

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
