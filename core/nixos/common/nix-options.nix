{ config, ... }:
{
  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Optimise nix store
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  # Allow using unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable nix-command and flakes features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
