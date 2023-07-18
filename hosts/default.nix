{ lib, inputs, nixpkgs, home-manager, hyprland, neovim-nightly-overlay, user, keyid, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;

  overlays = [
    neovim-nightly-overlay.overlay
  ];
in
{
  phobos = lib.nixosSystem {
    inherit system;

    specialArgs = {
      inherit inputs system user hyprland;
      host = {
        hostName = "phobos";
      };
    };

    modules = [
      hyprland.nixosModules.default

      ./phobos
      ./configuration.nix

      ./programs

      {
        nixpkgs.overlays = overlays;
      }

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user keyid;
          host = {
            hostName = "phobos";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
          ];
        };
      }
    ];
  };
}
