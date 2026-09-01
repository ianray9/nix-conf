{ lib, ... }:
{
  options.my.desktop = {
    terminal = lib.mkOption {
      type = lib.types.enum [
        "ghostty"
      ];

      default = "ghostty";
    };

    launcher = lib.mkOption {
      type = lib.types.enum [
        "vicinae"
        "raycast"
      ];

      default = "vicinae";
    };
  };
}
