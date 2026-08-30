{ config, lib, pkgs, ... }:
let
  cfg = config.my.llms.lemonade;
in
{
  options.my.llms.lemonade = {
    enable = lib.mkEnableOption "Lemonade local LLM server";
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.isDarwin;
        message = "Lemonade is currently configured for macOS.";
      }

      {
        assertion = config.my.llms.backend.type == "lemonade";
        message = ''
          my.llms.lemonade.enable requires
          my.llms.backend.type = "lemonade".
        '';
      }
    ];
  };
}

