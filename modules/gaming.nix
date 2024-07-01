{ config, lib, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    libstrangle
    bottles
    lutris
  ];

   environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/tim/.steam/root/compatibilitytools.d";
  };

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
  };

  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
}
