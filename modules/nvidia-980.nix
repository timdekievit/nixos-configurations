{ config, lib, pkgs, ...}:

{
   hardware.nvidia = {
    modesetting.enable = true;
  };

  hardware.nvidia.forceFullCompositionPipeline = true;

  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.displayManager.setupCommands = ''${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 2560x1080+0+0 --output HDMI-0 --off '';

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
  ];

}
