{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true; # does not work
      mode = "enable";
    };

    settings = {
      repaint_delay = 6;

      wayland_enable_ime = "no";
      
      remember_window_size  = "no";
      initial_window_width  = "640";
      initial_window_height = "400";

      tab_bar_edge        = "top";
      tab_bar_style       = "separator";
      tab_separator       = "' | '";
      tab_bar_align       = "center";
      tab_activity_symbol = "(!)";

      scrollbar       = "always";
      scrollbar_width = 1;

      clear_all_shortcuts = "yes";
      
      "map ctrl+shift+c" = "copy_to_clipboard";
      "map ctrl+shift+v" = "paste_from_clipboard";

      "map ctrl+shift+k" = "scroll_line_up";
      "map ctrl+shift+j" = "scroll_line_down";
      "map ctrl+shift+page_up"   = "scroll_page_up";
      "map ctrl+shift+page_down" = "scroll_page_down";
      "map ctrl+alt+k" = "scroll_page_up";
      "map ctrl+alt+j" = "scroll_page_down";
      "map ctrl+shift+home" = "scroll_home";
      "map ctrl+shift+end"  = "scroll_end";

      "map ctrl+shift+t" = "launch --type tab --cwd current --location neighbor";
      "map ctrl+alt+t"   = "launch --type tab --location neighbor";
      #"map ctrl+shift+y" = "launch --type tab --cwd current --location neighbor y";
      #"map ctrl+alt+y"   = "launch --type tab --location neighbor y";
      "map ctrl+shift+h" = "previous_tab";
      "map ctrl+shift+l" = "next_tab";
      "map ctrl+shift+w" = "close_window";
      "map ctrl+alt+w"   = "close_os_window";
      
      font_family      = "Monocraft";
      bold_font        = "Monocraft";
      italic_font      = "Monocraft";
      bold_italic_font = "Monocraft";

      font_size = 7;

      background              = "#191919";
      foreground              = "#776b53";
      cursor                  = "#fac814";
      selection_background    = "#776b53";
      color0                  = "#321200";
      color8                  = "#423625";
      color1                  = "#b1270e";
      color9                  = "#ed5c20";
      color2                  = "#44a900";
      color10                 = "#55f237";
      color3                  = "#a9810b";
      color11                 = "#f1b731";
      color4                  = "#578499";
      color12                 = "#85cfec";
      color5                  = "#96363c";
      color13                 = "#e04b5a";
      color6                  = "#b2591d";
      color14                 = "#f07c14";
      color7                  = "#776b53";
      color15                 = "#ffc800";
      selection_foreground    = "#191919";
      active_tab_foreground   = "#eeeeee";
      active_tab_background   = "#776b53";
      inactive_tab_foreground = "#776b53";
      inactive_tab_background = "#141414";
    };
  };
}