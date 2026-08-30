{ config, lib, pkgs, ... }:
let
  cfg = config.my.llms.opencode.docker;
  opencodeCfg = config.my.llms.opencode;
  llm = config.my.llms.backend;

  configJson =
    (pkgs.formats.json {}).generate "opencode-docker.json" {
      "$schema" = "https://opencode.ai/config.json";

      provider = {
        lemonade = {
          npm = "@ai-sdk/openai-compatible";
          name = "Lemonade (local host)";

          options = {
            baseURL =
              "http://host.docker.internal:${toString llm.port}/v1";
          };

          models = opencodeCfg.models;
        };
      };

      model = opencodeCfg.defaultModel;
    };

in
{
  options.my.llms.opencode.docker = {
    enable = lib.mkEnableOption "Dockerized OpenCode";

    image = lib.mkOption {
      type = lib.types.str;
      default = "ghcr.io/anomalyco/opencode";
      description = "OpenCode Docker image.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.docker

      (pkgs.writeShellScriptBin "opencode-docker" ''
        set -euo pipefail

        if [ "$#" -lt 1 ]; then
          echo "Usage: opencode-docker <project-directory> [opencode arguments...]"
          exit 1
        fi

        PROJECT="$(cd "$1" && pwd)"
        shift

        if [ ! -d "$PROJECT" ]; then
          echo "Project directory does not exist: $PROJECT"
          exit 1
        fi

        CONFIG="$(mktemp /tmp/opencode-config.XXXXXX)"
        trap 'rm -f "$CONFIG"' EXIT

        cp ${configJson} "$CONFIG"

        exec docker run \
          --rm \
          -it \
          --network bridge \
          --add-host host.docker.internal:host-gateway \
          -v "$PROJECT:/workspace:rw" \
          -v "$CONFIG:/root/.config/opencode/opencode.json:ro" \
          -w /workspace \
          ${lib.escapeShellArg cfg.image} \
          "$@"
      '')
    ];
  };
}
