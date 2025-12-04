{ pkgs, ... }: {
  programs.adb.enable = true;

  services.udev.packages = with pkgs; [
    android-udev-rules
    androidenv.androidPkgs_9_0.platform-tools
    androidComposition.androidsdk
    androidComposition.ndk-bundle
  ];

  nixpkgs.config.android_sdk.accept_license = true;
}
