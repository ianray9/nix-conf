{ ... }
{
  options.my.nix.gc = {

    enable = lib.mkEnableOption "Automatic GC";

    keep = lib.mkOption {
      type = lib.types.str;
      default = "30d";
    };

    weekday = lib.mkOption {
      type = lib.types.int;
      default = 0;
    };

    hour = lib.mkOption {
      type = lib.types.int;
      default = 3;
    };
  };

  config = lib.mkIf config.my.nix.gc.enable {

    nix.gc = {

      automatic = true;

      interval = {
        Weekday = config.my.nix.gc.weekday;
        Hour = config.my.nix.gc.hour;
        Minute = 0;
      };

      options = "--delete-older-than ${config.my.nix.gc.keep}";
    };

    nix.optimise.automatic = true;
  };
}
