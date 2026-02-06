{pkgs, ...}: {
  home.packages =
    # Filter out unwanted KDE apps (e.g., Discover)
    builtins.filter (pkg: pkg.pname != "plasma-discover") (
      with pkgs.kdePackages; [
        # Essential KDE Applications
        kate # Text editor
        ark # Archive manager
        gwenview # Image viewer
        dolphin # File manager
        konsole # Terminal
      ]
    )
    ++ (with pkgs; [
      bibata-cursors
    ]);
}
