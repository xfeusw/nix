{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    androidStudioPackages.stable
    # androidsdk
    # android-tools
    # jetbrains.idea-oss
  ];
}
