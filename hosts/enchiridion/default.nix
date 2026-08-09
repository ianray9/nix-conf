{ pkgs, ... }:
{
  imports = [
    ../../modules/platforms/darwin
  ];

  system.primaryUser = "ianrayburn";
  
  users.users.ianrayburn = {
    name = "ianrayburn";
    home = "/Users/ianrayburn";
  };

  home-manager.users.ianrayburn = import ./home.nix;
  home-manager.backupFileExtension = "backup";

  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
