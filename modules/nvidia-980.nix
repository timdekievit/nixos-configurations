{ config, lib, pkgs, ...}:

{
   hardware.nvidia = {
    modesetting.enable = true;
    open = false;
  };

  # hardware.nvidia.forceFullCompositionPipeline = true;

  services.xserver.videoDrivers = ["nvidia"];
  #   services.xserver.displayManager.setupCommands = ''
  #   ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 2560x1080 --rate 144 --fbmm 600x340 --dpi 96 --output HDMI-0 --off

  # '';

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
  ];

}
