{ ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true; # Does not work
      mode = "enable";
    };

    settings = {
      repaint_delay = 6;

      wayland_enable_ime = "no";
      
      remember_window_size  = "no";
      initial_window_width  = "640";
      initial_window_height = "400";

      single_window_margin_width = 1;

      tab_bar_edge         = "top";
      tab_bar_style        = "separator";
      tab_separator        = "' | '";
      tab_bar_align        = "center";
      tab_activity_symbol  = "(!)";
      tab_title_max_length = 35;

      scrollbar       = "always";
      scrollbar_width = 1;

      clear_all_shortcuts = "yes";
      
      font_family      = "Monocraft";
      bold_font        = "Monocraft";
      italic_font      = "Monocraft";
      bold_italic_font = "Monocraft";

      font_size = 7;

      active_tab_foreground   = "#eeeeee"; # /nix/store/mibs023kpv17r2g62gbfnhfjib3z9iyq-kitty-themes-0-unstable-2024-08-14/share/kitty-themes/themes/Treehouse.conf 
      active_tab_background   = "#776b53"; # does not contain tab colors.
      inactive_tab_foreground = "#776b53";
      inactive_tab_background = "#141414";
    };
    
    themeFile = "Treehouse";

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";

      "ctrl+shift+k"         = "scroll_line_up";
      "ctrl+shift+j"         = "scroll_line_down";
      "ctrl+shift+page_up"   = "scroll_page_up";
      "ctrl+shift+page_down" = "scroll_page_down";
      "ctrl+alt+k"           = "remote_control scroll-window 0.5p-";
      "ctrl+alt+j"           = "remote_control scroll-window 0.5p";
      "ctrl+shift+home"      = "scroll_home";
      "ctrl+shift+end"       = "scroll_end";

      "ctrl+shift+t" = "launch --type tab --cwd current --location neighbor";
      "ctrl+alt+t"   = "launch --type tab --location neighbor";
      #"ctrl+shift+y" = "launch --type tab --cwd current --location neighbor y";
      #"ctrl+alt+y"   = "launch --type tab --location neighbor y";
      "ctrl+shift+h" = "previous_tab";
      "ctrl+shift+l" = "next_tab";
      "ctrl+shift+w" = "close_window";
      "ctrl+alt+w"   = "close_os_window";
    };
  };
}