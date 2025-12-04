{pkgs, ...}: {
  programs.adb.enable = true;

  services.udev.packages = with pkgs; [
    androidenv.androidPkgs.platform-tools
    androidenv.androidPkgs.androidsdk
    androidenv.androidPkgs.ndk-bundle
  ];

  nixpkgs.config.android_sdk.accept_license = true;
}
