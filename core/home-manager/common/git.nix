{pkgs, ...}: {
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;

    userName = "Jakub";
    userEmail = "204088010+Vidariondr@users.noreply.github.com";

    signing = {
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA7NeV9c7rCV22eYcLBXr9LWCt0XPfjQ3OavIXLSouPk";
      signByDefault = true;
    };

    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "main";
      core.autocrlf = "input"; # changes Windows-style line endings to Unix-style (CRLF to LF) when saving the code to the repo, but doesn't change it when pulling
      credential.credentialStore = "cache";
      advice.addIgnoredFile = "false";
    };
  };
}
