{ pkgs, lib, user, ... }:

{
  imports = [
    ../../modules/hyprland
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
    timeout = 5;
  };

  # nmcli device wifi connect <SSID> password <PASSWORD>
  networking.networkmanager.enable = true;
}
