{ config, lib, pkgs, ...}:

{
   hardware.nvidia = {
    modesetting.enable = true;
  };

  # hardware.nvidia.prime = {
  #   sync.enable = true;
  #   # Enable if using an external GPU
  #   allowExternalGpu = false;

  #   # Make sure to use the correct Bus ID values for your system!
  #   intelBusId = "PCI:0:2:0";
  #   nvidiaBusId = "PCI:1:0:0";
  # };  

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
