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
    ];

    casks = [
      "vicinae"
    ];

    taps = [
    ];
  };
}
