{ config, lib, pkgs, ...}:

{
  services.libinput.enable = false;
  # services.libinput.mouse.accelProfile = "flat";
  # services.libinput.touchpad.naturalScrolling = true;
}