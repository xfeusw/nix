# modules/hardware/graphics.nix
{ pkgs, config, ... }:
{
  nixpkgs.config.nvidia.acceptLicense = true;

  # Hardware acceleration and graphics
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required for Wayland
    modesetting.enable = true;

    # Enable power management (recommended for laptops)
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # Use the open source kernel module (not compatible with 940MX - use proprietary)
    open = false;

    # Enable NVIDIA settings menu
    nvidiaSettings = true;

    # Select the appropriate driver version for 940MX
    # The 940MX requires legacy drivers (470.xx series is the last to support it)
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

    # PRIME configuration for laptop with both Intel and NVIDIA GPUs
    prime = {
      # Enable PRIME offload mode (recommended for laptops)
      # This allows you to use Intel for regular tasks and NVIDIA for demanding apps
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Alternative: Use sync mode (both GPUs always active - worse battery life)
      # Uncomment these and comment out offload section if you prefer:
      # sync.enable = true;

      # Find your bus IDs by running: lspci | grep -E "VGA|3D"
      # Intel bus ID (integrated GPU)
      intelBusId = "PCI:0:2:0";  # Typical value, verify with lspci

      # NVIDIA bus ID (discrete GPU)
      nvidiaBusId = "PCI:1:0:0";  # Typical value, verify with lspci
    };
  };

  # Environment variables for NVIDIA
  environment.sessionVariables = {
    # Force apps to use NVIDIA when needed
    # WLR_NO_HARDWARE_CURSORS = "1";  # Uncomment if cursor issues on Wayland
  };

  # Blacklist nouveau (open-source NVIDIA driver)
  boot.blacklistedKernelModules = [ "nouveau" ];
}
