{ config, lib, ...}:

{
   hardware.nvidia = {
    modesetting.enable = true;
  };

  hardware.nvidia.prime = {
    sync.enable = true;
    # Enable if using an external GPU
    allowExternalGpu = false;

    # Make sure to use the correct Bus ID values for your system!
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };  

  services.xserver.videoDrivers = ["nvidia"];

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];

}
