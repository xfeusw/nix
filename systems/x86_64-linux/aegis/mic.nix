{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    usbutils
    libusb1
    pavucontrol
    android-mic
  ];

  # Bus 001 Device 011: ID 2717:ff40 Xiaomi Inc. Mi/Redmi series (MTP)
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="2717", ATTR{idProduct}=="ff40", TAG+="uaccess"
  '';
}
