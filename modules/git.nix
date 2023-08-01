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

  home = {
    sessionPath = [
      "$HOME/.config/git/bin"
    ];

    file = {
      ".config/git/bin/commit" = {
        executable = true;
        text = ''
          #!/bin/sh

          TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
          SCOPE=$(gum input --placeholder "scope")

          test -n "$SCOPE" && SCOPE="($SCOPE)"

          SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
          DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

          gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
        '';
      };
    };
  };
}
