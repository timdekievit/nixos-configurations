{
  pkgs,
  config,
  ...
}: {

  home.packages = with pkgs; [
    jetbrains.clion
    jetbrains.goland
    jetbrains.rider
  ];
}