{
  pkgs,
  inputs,
  ...
}: let
  pinnedJDK = pkgs.jdk17;
  buildToolsVersion = "30.0.0";
  ndkVersion = "27.3.13750724";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.1";
    buildToolsVersions = [buildToolsVersion "30.0.1"];
    includeEmulator = true;
    emulatorVersion = "34.1.19";
    platformVersions = ["33" "30"];
    includeSources = false;
    includeSystemImages = true;
    systemImageTypes = ["google_apis_playstore"];
    abiVersions = ["armeabi-v7a" "arm64-v8a" "x86_64"];
    cmakeVersions = ["3.10.2" "3.22.1"];
    includeNDK = true;
    ndkVersions = [ndkVersion];
    useGoogleAPIs = true;
    useGoogleTVAddOns = false;
    includeExtras = [
      "extras;google;gcm"
    ];
  };
  sdk = androidComposition.androidsdk;
  ANDROID_SDK_ROOT_PATH = "${androidComposition.androidsdk}/libexec/android-sdk";
in {
  home.packages = with pkgs; [
    pinnedJDK
    gradle
    kotlin
    kotlin-language-server
    ktlint
    detekt
    (android-studio.withSdk sdk)
    pkg-config
    ccache
    nodejs_22
  ];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  home.sessionVariables = {
    JAVA_HOME = "${pinnedJDK}";
    ANDROID_SDK_ROOT = ANDROID_SDK_ROOT_PATH;
    ANDROID_HOME = ANDROID_SDK_ROOT_PATH;
    ANDROID_NDK_ROOT = "${ANDROID_SDK_ROOT_PATH}/ndk/${ndkVersion}";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_SDK_ROOT_PATH}/build-tools/${buildToolsVersion}/aapt2";
  };
}
