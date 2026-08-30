{ lib, ... }:
{
  imports = [
    ./options.nix
    ./lemonade.nix
    ./llama-cpp.nix
    ./models.nix
    ./opencode.nix
    ./opencode-docker.nix
  ];

  config = {
    my.llms.backend.type = lib.mkDefault "lemonade";
    my.llms.llama-cpp.enable = lib.mkDefault false;
    my.llms.lemonade.enable = lib.mkDefault true;

    my.llms.opencode.docker.enable = lib.mkDefault true;
    my.llms.opencode.enable = lib.mkDefault false;
  };
}
