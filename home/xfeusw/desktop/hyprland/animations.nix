{
  animations = {
    enabled = true;

    bezier = [
      "overshot, 0.05, 0.9, 0.1, 1.05"
      "smoothOut, 0.36, 0, 0.66, -0.56"
      "smoothIn, 0.25, 1, 0.5, 1"
    ];

    animation = [
      "windows, 1, 4, overshot, slide"
      "windowsOut, 1, 4, smoothOut, slide"
      "border, 1, 6, default"
      "fade, 1, 4, smoothIn"
      "workspaces, 1, 4, default"
    ];
  };
}
