{
  pkgs,
  config,
  ...
}: {
  
  home.file.".config/rofi" = {
    source = ./configs;
    # copy the scripts directory recursively
    recursive = true;
  };

  programs.rofi.enable = true;
  # programs.rofi.theme = "rounded-nord-dark.rasi";
}