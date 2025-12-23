{pkgs, ...}: {
  programs.adb.enable = true;

  services.udev.packages = with pkgs; [
    androidenv.androidPkgs
  ];

  nixpkgs.config.android_sdk.accept_license = true;
}
