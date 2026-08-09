{
  imports = [
    ./llama-cpp.nix
    ./models.nix
  ];

  my.llms.llama-cpp = {
    enable = true;
  };
}
