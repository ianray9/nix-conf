{ config, lib, ... }:
{
  options.my.llms = {
    backend = {
      type = lib.mkOption {
        type = lib.types.enum [
          "lemonade"
          "llama-cpp"
        ];

        default = "lemonade";
      };

      host = lib.mkOption {
        type = lib.types.str;
        default = "127.0.0.1";
      };

      port = lib.mkOption {
        type = lib.types.port;
        default = 13305;
      };

      baseURL = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
        default =
          "http://${config.my.llms.backend.host}:${toString config.my.llms.backend.port}/v1";
      };
    };


    profile = lib.mkOption {
      type = lib.types.enum [
        "m1-32gb"
        "rtx-2060-12gb"
      ];

      default = "m1-32gb";

      description = "Hardware profile used for local LLM defaults.";
    };
  };
}

