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
#   programs.rofi.theme = 
#     let
#   # Use `mkLiteral` for string-like values that should show without
#   # quotes, e.g.:
#   # {
#   #   foo = "abc"; =&gt; foo: "abc";
#   #   bar = mkLiteral "abc"; =&gt; bar: abc;
#   # };
#   inherit (config.lib.formats.rasi) mkLiteral;
# in {
#   "*" = {
#     background-color = mkLiteral "#000000";
#     foreground-color = mkLiteral "rgba ( 250, 251, 252, 100 % )";
#     border-color = mkLiteral "#FFFFFF";
#     width = 512;
#   };

#   "#inputbar" = {
#     children = map mkLiteral [ "prompt" "entry" ];
#   };

#   "#textbox-prompt-colon" = {
#     expand = false;
#     str = ":";
#     margin = mkLiteral "0px 0.3em 0em 0em";
#     text-color = mkLiteral "@foreground-color";
#   };

    programs.rofi.theme = "powermenu.rasi";
}