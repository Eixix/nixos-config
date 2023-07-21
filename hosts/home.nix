{ pkgs, user, ... }:

{
  imports = [
    ../modules/hyprland/home.nix
    ../modules/kitty.nix
    ../modules/git.nix
    ../modules/zsh/home.nix
    ../modules/waybar.nix
    ../modules/rofi/home.nix
    ../modules/gnupg.nix
    ../modules/neovim.nix
  ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";

    packages = with pkgs; [
      killall
      btop
      zip
      unzip
      tree
      bat
      exa
      usbutils

      yubikey-touch-detector

      spotify

      xdg-utils

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
    ];

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
