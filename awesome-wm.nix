{ config, lib, ...}:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "none+awesome";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };

  };
}
