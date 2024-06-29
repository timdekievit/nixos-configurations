{
  pkgs,
  config,
  ...
}: {
  home.file.".config/awesome/rc.lua".source = ./rc.lua;
}