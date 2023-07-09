{ config, lib, pkgs, user, ... }:

{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      btop
      firefox
      zip
      unzip

      neovim
      kitty
    ];

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
