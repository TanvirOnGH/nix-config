# GPU (Nvidia) Configuration
#- <https://nixos.wiki/wiki/Nvidia>
#- <https://wiki.hyprland.org/Nvidia>
{
  pkgs,
  config,
  ...
}: {
  # nvidia is the proprietary driver for Nvidia GPUs
  services.xserver.videoDrivers = ["nvidia"];

  boot.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "i2c-nvidia_gpu"];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
  };

  /*
  environment.variables = {
    GBM_BACKEND = "nvidia-drm"; # Remove if Firefox crashes
  };
  */

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    VDPAU_DRIVER = "va_gl";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # Remove if Discord windows not displaying or screen sharing not working in Zoom
  };

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    nvidia-vaapi-driver
  ];
}