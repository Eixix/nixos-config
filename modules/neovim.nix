{ config, pkgs, location, ... }:

{
  home = {
    packages = with pkgs; [
      fd
      ripgrep
      tree-sitter
    ];

    file = {
      ".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${location}/nvim";
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
