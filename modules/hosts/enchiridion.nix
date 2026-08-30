{ self, inputs, ... }:
{
  flake.darwinConfigurations.enchiridion =
    inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      modules = [
        inputs.home-manager.darwinModules.home-manager

        {
          system.configurationRevision =
            self.rev or self.dirtyRev or null;

          system.primaryUser = "ianrayburn";

          users.users.ianrayburn = {
            name = "ianrayburn";
            home = "/Users/ianrayburn";
          };

          home-manager.users.ianrayburn = {
            imports = [
              self.homeModules.stanton

              ../_legacy/shell
              ../_legacy/cli
              ../_legacy/dev
              ../_legacy/desktop
              ../_legacy/packages
              ../_legacy/core
              ../_legacy/platforms
              ../_legacy/llms
            ];

            my = {
              desktop = {
                terminal = "ghostty";
                launcher = "vicinae";
              };

              platform = {
                rebuildCmd =
                  "sudo darwin-rebuild switch --flake ~/.config/nix";
                clipboardCmd = "pbcopy";
              };

              llms = {
                profile = "m1-32gb";

                backend = {
                  type = "lemonade";
                  host = "127.0.0.1";
                  port = 13305;
                };

                opencode.enable = true;
              };
            };
          };

          home-manager.backupFileExtension = "backup";

          nix.settings.experimental-features = [
            "nix-command"
            "flakes"
          ];

          system.stateVersion = 6;
        }
      ];
    };
}
