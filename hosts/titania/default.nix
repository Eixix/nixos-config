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

  # nmcli device wifi connect <SSID> password <PASSWORD>
  networking = {
    hostName = "titania";
    networkmanager.enable = true;
  };
}
