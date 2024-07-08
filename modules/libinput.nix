{ config, lib, pkgs, ...}:

{
  services.libinput.enable = true;
  # services.libinput.mouse.accelProfile = "flat";
  services.libinput.touchpad.naturalScrolling = true;
}