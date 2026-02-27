{
  config,
  pkgs,
  ...
}: {
  services.usbguard = {
    enable = false;

    presentControllerPolicy = "keep";
    presentDevicePolicy = "keep";
    insertedDevicePolicy = "apply-policy";
    implicitPolicyTarget = "allow";
    IPCAllowedUsers = [
      "xfeusw"
      "root"
    ];
  };
}
