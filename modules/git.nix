{
  programs.git = {
    enable = true;
    userName = "Michael Strobel";
    userEmail = "mstrobel97@gmail.com";
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };
}
