{...}: {
  imports = [
    ./fonts.nix
    ./kernel.nix
    ./locale.nix
    ./networking.nix
    ./nix-options.nix
    ./packages.nix
    ./ssh.nix
    ./systemd-boot.nix
    ./timezone.nix
    ./users.nix
    ./zsh.nix
  ];
}
