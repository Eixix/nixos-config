{ lib, inputs, nixpkgs, home-manager, hyprland, neovim-nightly-overlay, user, location, ... }:

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
  titania = lib.nixosSystem {
    inherit system;

    specialArgs = {
      inherit inputs system user hyprland;
      host = {
        hostName = "titania";
      };
    };

    modules = [
      hyprland.nixosModules.default

      ./titania
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
          inherit user location;
          host = {
            hostName = "titania";
          };
        };
        home-manager.users.${user.name} = {
          imports = [
            ./home.nix
          ];
        };
      }
    ];
  };
}
