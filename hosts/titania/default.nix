{ pkgs, lib, user, ... }:

{
  imports = [
    ../../modules/hyprland
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
    timeout = 5;
  };
}
