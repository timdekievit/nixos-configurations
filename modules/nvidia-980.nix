{ config, lib, pkgs, ...}:

{
   hardware.nvidia = {
    modesetting.enable = true;
  };

  hardware.nvidia.forceFullCompositionPipeline = true;

  services.xserver.videoDrivers = ["nvidia"];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
  ];

}
