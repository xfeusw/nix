{ pkgs, config, ... }:
{
  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # 1660 Ti requires the proprietary driver
    open = false;

    nvidiaSettings = true;

    # Use newest stable NVIDIA driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Kill nouveau, let the real driver take the wheel
  boot.blacklistedKernelModules = [ "nouveau" ];
}
