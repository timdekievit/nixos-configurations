{ config, lib, pkgs, ...}:

{
   hardware.nvidia = {
    modesetting.enable = true;
  };

  hardware.nvidia.forceFullCompositionPipeline = true;

  services.xserver.videoDrivers = ["nvidia"];
  services.displayManager.setupCommands = ''${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 2560x1080 --pos 0x0 --rotate normal --output HDMI-0 --off '';

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
  ];

}
