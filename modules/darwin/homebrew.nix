{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [ ];

    taps = [ ];

    casks = [
      "vicinae"
    ];
  };
}
