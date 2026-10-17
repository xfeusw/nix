{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    usbutils
    libusb1
    pavucontrol
    android-mic
  ];
}
