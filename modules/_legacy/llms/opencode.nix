{ config, lib, pkgs, ... }:
let
  cfg = config.my.llms.opencode;
  llm = config.my.llms.backend;

  configFile =
    (pkgs.formats.json {}).generate "opencode.json" {
      "$schema" = "https://opencode.ai/config.json";

      provider = {
        lemonade = {
          npm = "@ai-sdk/openai-compatible";
          name = "Lemonade (local host)";

          options = {
            baseURL =
              "http://${llm.host}:${toString llm.port}/v1";
          };

          models = cfg.models;
        };
      };

      model = cfg.defaultModel;
    };

in
{
  options.my.llms.opencode = {
    enable = lib.mkEnableOption "OpenCode";

    defaultModel = lib.mkOption {
      type = lib.types.str;
      default = "lemonade/Qwen3-0.6B-GGUF";
      description = "Default OpenCode model.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.opencode
    ];

    home.file.".config/opencode/opencode.json".source = configFile;
  };
}

