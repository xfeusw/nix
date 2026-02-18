{
  config,
  pkgs,
  ...
}:
{
  services.usbguard = {
    enable = true;

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
