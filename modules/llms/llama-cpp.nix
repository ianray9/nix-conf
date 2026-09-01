{ ... }:
{
  flake.homeModules.llama-cpp = { config, lib, pkgs, ... }:
    let
      cfg = config.my.llms.llama-cpp;

    llamaPackage =
      if cfg.backend == "cuda" then
        pkgs.llama-cpp.override {
          cudaSupport = true;
        }
      else
        pkgs.llama-cpp;

    serverPackage =
      pkgs.writeShellScriptBin "llama-server-local" ''
      exec ${llamaPackage}/bin/llama-server \
      --models-preset "$HOME/.config/llama.cpp/models.ini" \
      --host ${lib.escapeShellArg cfg.server.host} \
      --port ${toString cfg.server.port} \
      --models-max 1 \
      --sleep-idle-seconds ${toString cfg.sleepTime} \
      "$@"
      '';

    in
    {
      options.my.llms.llama-cpp = {
        enable = lib.mkEnableOption "llama.cpp";

        backend = lib.mkOption {
          type = lib.types.enum [
            "cpu"
              "metal"
              "cuda"
          ];

          default =
            if config.my.llms.profile == "m1-32gb"
              then "metal"
            else "cuda";

          description = ''
            llama.cpp acceleration backend.

            Use "metal" on Apple Silicon and "cuda" on NVIDIA Linux.
            '';
        };

        contextSize = lib.mkOption {
          type = lib.types.int;

          default =
            if config.my.llms.profile == "rtx-2060-12gb"
              then 16384
            else 32768;
        };

        gpuLayers = lib.mkOption {
          type = lib.types.int;
          default = 999;
          description = "Number of model layers to offload to the GPU.";
        };

        flashAttention = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };

        sleepTime = lib.mkOption {
          type = lib.types.int;
          default = 900;
          description = "Seconds of inactivity before llama-server sleeps.";
        };

        server = {
          enable = lib.mkEnableOption "llama.cpp server";

          host = lib.mkOption {
            type = lib.types.str;
            default = config.my.llms.backend.host;
          };

          port = lib.mkOption {
            type = lib.types.port;
            default = config.my.llms.backend.port;
          };
        };
      };

      config = lib.mkIf cfg.enable {
        assertions = [
        {
          assertion = config.my.llms.backend.type == "llama-cpp";
          message = ''
            my.llms.llama-cpp.enable requires
            my.llms.backend.type = "llama-cpp".
            '';
        }
        ];

        home.packages =
          [
          llamaPackage
          ]
          ++ lib.optional cfg.server.enable serverPackage;

        home.file.".config/llama.cpp/models.ini".text = ''
# Models are managed separately.
# This file is only used when the direct llama.cpp backend is enabled.
          '';
      };
  };
}
