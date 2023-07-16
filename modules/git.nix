{ keyid, ... }:

{
  programs.git = {
    enable = true;
    userName = "Michael Strobel";
    userEmail = "mstrobel97@gmail.com";
    signing = {
      key = keyid;
      signByDefault = true;
    };
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
    };
    aliases = {
      s = "status";
      f = "fetch --prune";
      a = "add";
      c = "commit";
      p = "pull";
      pu = "push";
      sw = "switch";
      d = "branch -d";
    };
  };
}
