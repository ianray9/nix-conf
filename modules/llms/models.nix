{ config, pkgs, ... }:
let
  modelsPreset = (pkgs.formats.ini {}).generate "llama-models.ini" {
    "*" = {
      "n-gpu-layers" = 999;
      "flash-attn" = true;
      "ctx-size" = config.my.llms.llama-cpp.contextSize;
    };

    "QuantFactory/SmolLM2-135M-Instruct-GGUF:Q4_K_M" = {
      alias = "smollm";
      temp = 0.7;
    };
  };

in
{
  home.file.".config/llama.cpp/models.ini".source = modelsPreset;
}
