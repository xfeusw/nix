{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = [
    # pkgs.android-studio
    # pkgs.android-studio-for-platform
    # pkgs.android-studio-tools
    pkgs.flutter
    pkgs.google-chrome
  ];

  home.file = {
    ".local/share/flutter-sdk".source = "${pkgs.flutter}";
    ".local/share/dart-sdk".source = "${pkgs.dart}";
  };

  # home.variables = {
  #   FLUTTER_SDK = "${pkgs.flutter}";
  #   ANDROID_HOME = "${androidSdkGlobal.androidsdk}/libexec/android-sdk";
  #   ANDROID_SDK_ROOT = "${androidSdkGlobal.androidsdk}/libexec/android-sdk";
  #   CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome";
  # };
}
