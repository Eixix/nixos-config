{ user, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    syntaxHighlighting.enable = true;

    history.expireDuplicatesFirst = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/${user}/flake/#titania";
    };
  };
}
