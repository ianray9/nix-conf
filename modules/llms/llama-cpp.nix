{ config, lib, pkgs, ... }:
let
  cfg = config.my.llms.llama-cpp;

  llamaPackage =
    if pkgs.stdenv.isLinux && cfg.cuda then
      pkgs.llama-cpp.override {
        cudaSupport = true;
      }
    else
      pkgs.llama-cpp;
in
{
  options.my.llms.llama-cpp = {
    enable = lib.mkEnableOption "llama.cpp";

    cuda = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable CUDA support for llama.cpp.";
    };

    contextSize = lib.mkOption {
      type = lib.types.int;
      default = 32768;
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
        default = "127.0.0.1";
      };

      port = lib.mkOption {
        type = lib.types.port;
        default = 8080;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      llamaPackage

      (pkgs.writeShellScriptBin "llama-server-local" ''
        exec llama-server \
          --models-preset "$HOME/.config/llama.cpp/models.ini" \
          --host ${lib.escapeShellArg cfg.server.host} \
          --models-max 1 \
          --sleep-idle-seconds ${toString cfg.sleepTime} \
          --port ${toString cfg.server.port} \
          "$@"
      '')
    ];
  };
}
