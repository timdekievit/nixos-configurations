{
  pkgs,
  config,
  ...
}: {

  programs.firefox.enable = true;
  home.packages = with pkgs; [
      brave
      tor-browser
      mullvad-browser
  ];
}