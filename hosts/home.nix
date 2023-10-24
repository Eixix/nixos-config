{ pkgs, user, location, ... }:

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
    ../modules/dunst.nix
    ../modules/chrome.nix
    ../modules/pass.nix
    ../modules/swaylock.nix
  ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 6;
    };

    sessionPath = [
      "${location}/bin"
    ];

    sessionVariables = {
      LOCATION = location;
    };

    packages = with pkgs; [
      killall
      btop
      zip
      unzip
      tree
      bat
      eza
      usbutils
      xdg-utils

      yubikey-touch-detector

      playerctl

      grim
      slurp

      vim
      telegram-desktop
      discord
      spotify

      pamixer
      brightnessctl

      gum

      cargo
      nodejs
      clang
      wl-clipboard
    ];

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
