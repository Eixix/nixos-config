{ pkgs, inputs, user, ... }:

{
  users.users.${user.name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "docker" ];
    shell = pkgs.zsh;
    initialPassword = user.initialPassword;
  };

  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  fonts.fonts = with pkgs; [
    font-awesome
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];

  services = {
    udev.packages = [ pkgs.yubikey-personalization ];
    pcscd.enable = true;
    blueman.enable = true;
  };

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    swaylock.u2fAuth = true;
    greetd.u2fAuth = true;
  };

  hardware = {
    pulseaudio.enable = true;

    bluetooth.enable = true;
  };

  virtualisation.docker.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };
  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.05";
  };
}
