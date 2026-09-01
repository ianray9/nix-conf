{ lib, ... }:
{
  options.my.platform = {

    rebuildCmd = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Command to rebuild the system";
    };

    clipboardCmd = lib.mkOption {
      type = lib.types.str;
      default = "cat";
      description = "Clipboard copy command";
    };
  };
}
