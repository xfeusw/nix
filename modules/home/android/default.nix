{
  config,
  pkgs,
  inputs,
  ...
}:

let
  myAndroidStudio = pkgs.symlinkJoin {
    name = "myAndroidStudio";
    paths = with pkgs; [
      android-studio
      android-tools
      androidSdkGlobal.androidsdk
      flutter.unwrapped
      # dart
      gnumake
      check
      pkg-config
      glibc
      jdk17

      google-chrome
    ];

    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/flutter \
        --prefix ANDROID_JAVA_HOME=${pkgs.jdk17.home} \
        # --prefix DART_SDK=${pkgs.dart.out}

      wrapProgram $out/bin/android-studio \
        --prefix FLUTTER_SDK=${pkgs.flutter.unwrapped} \
        # --prefix DART_SDK=${pkgs.dart.out} \
        --prefix ANDROID_JAVA_HOME=${pkgs.jdk17.home}
    '';
  };

  androidSdkGlobal = pkgs.androidenv.composeAndroidPackages {
    # cmdLineToolsVersion = "13.0";
    # platformToolsVersion = "35.0.2";
    # buildToolsVersions = [
    #   "34.0.0"
    #   "35.0.0"
    # ];
    # platformVersions = [
    #   "34"
    #   "35"
    # ];
    abiVersions = [ "x86_64" ];
    includeEmulator = true;
  };
in
{
  home.packages = [
    myAndroidStudio
  ];

  # home.variables = {
  #   FLUTTER_SDK = "${pkgs.flutter}";
  #   ANDROID_HOME = "${androidSdkGlobal.androidsdk}/libexec/android-sdk";
  #   ANDROID_SDK_ROOT = "${androidSdkGlobal.androidsdk}/libexec/android-sdk";
  #   CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome";
  # };
}
