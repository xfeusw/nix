{
  config,
  pkgs,
  ...
}: {
  services.usbguard = {
    enable = true;

    presentControllerPolicy = "keep";
    insertedDevicePolicy = "block";
    IPCAllowedUsers = ["xfeusw"];
  };
}
