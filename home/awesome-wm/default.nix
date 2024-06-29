{
  pkgs,
  config,
  ...
}: {
  home.file.".config/awesome/rc.lua".source = ./rc.lua;
  home.file.".config/awesome/wallpaper.jpg".source = ./wallpaper.jpg;
}