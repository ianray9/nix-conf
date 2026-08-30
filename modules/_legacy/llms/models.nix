{ config, lib, ... }:
{
  options.my.llms.opencode.models = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = ''
      Models exposed to OpenCode through Lemonade.
      Model files themselves are managed by Lemonade.
    '';
  };

  config.my.llms.opencode.models = {
    "Qwen3-0.6B-GGUF" = {
      name = "Qwen3 0.6B";

      limit = {
        context = 40960;
        output = 8192;
      };
    };

    "Gemma-4-12B-it-MTP-GGUF" = {
      name = "Gemma4 12B it MTP";

      limit = {
        context = 40960;
        output = 8192;
      };
    };

    "Qwen3.5-9B-GGUF" = {
      name = "Qwen3.5 9B";

      limit = {
        context = 40960;
        output = 8192;
      };
    };
  };
}
