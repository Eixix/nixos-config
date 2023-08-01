{ user, ... }:

{
  programs.git = {
    enable = true;
    userName = user.fullName;
    userEmail = user.email;
    signing = {
      key = user.keyid;
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
