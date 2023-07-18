{
  description = "Personal NixOS/Home-Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, neovim-nightly-overlay, hyprland, ... }:
    let
      user = import ./user.nix;
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager hyprland neovim-nightly-overlay user;
        }
      );
    };
}
