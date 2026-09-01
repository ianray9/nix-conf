{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "pngpaste"
    ];

    casks = [
      "vicinae"
    ];

    taps = [ ];
  };
}
