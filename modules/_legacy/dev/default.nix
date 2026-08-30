{ lib, config, ... }:
{
  imports = [
    ./nvim
  ];

  config.my.dev.nvim.enable = lib.mkDefault true;
}

