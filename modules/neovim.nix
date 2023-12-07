{ config, pkgs, location, ... }:

{
  home = {
    packages = with pkgs; [
      fd
      ripgrep
      tree-sitter
      luajit
    ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
