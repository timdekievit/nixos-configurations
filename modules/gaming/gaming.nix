{ config, lib, pkgs, ...}:

{
  imports =
  [ 
    # ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    libstrangle
    bottles
    lutris
  ];

  programs.gamemode.enable = true;
}
