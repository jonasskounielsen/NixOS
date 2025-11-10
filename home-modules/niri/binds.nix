{ pkgs, ... }:
/* kdl */ ''
binds 
    Mod+T                                repeat=false { spawn "kitty"; }
    Mod+N                                repeat=false { spawn "fuzzel"; }
    Mod+S                                repeat=false { spawn "swaylock"; }

    Mod+C                                repeat=false { screenshot; }

    Mod+Q                                repeat=false { spawn-sh "poweroff"; }
    Mod+Shift+Q                          repeat=false { spawn-sh "reboot"; }
    Ctrl+Alt+Delete                                   { quit; }

    Mod+Shift+P                                       { power-off-monitors; }

    Mod+D                                             { toggle-overview; }

    Mod+W                                repeat=false { close-window; }

    Mod+Caps_Lock allow-inhibiting=false repeat=false { toggle-keyboard-shortcuts-inhibit; }

    Mod+H                                             { focus-column-or-monitor-left; }
    Mod+J                                             { focus-window-or-workspace-down; }
    Mod+K                                             { focus-window-or-workspace-up; }
    Mod+L                                             { focus-column-or-monitor-right; }
    Mod+Home                                          { focus-column-first; }
    Mod+End                                           { focus-column-last; }

    Mod+Ctrl+H                                        { move-column-left-or-to-monitor-left; }
    Mod+Ctrl+J                                        { move-window-down-or-to-workspace-down; }
    Mod+Ctrl+K                                        { move-window-up-or-to-workspace-up; }
    Mod+Ctrl+L                                        { move-column-right-or-to-monitor-right; }
    Mod+Ctrl+Home                                     { move-column-to-first; }
    Mod+Ctrl+End                                      { move-column-to-last; }
    
    Mod+Ctrl+Shift+J                                  { move-column-to-workspace-down; }
    Mod+Ctrl+Shift+K                                  { move-column-to-workspace-up; }
    Mod+Ctrl+U                                        { move-workspace-down; }
    Mod+Ctrl+I                                        { move-workspace-up; }

    Mod+Alt+H                                         { focus-monitor-left; }
    Mod+Alt+J                                         { focus-monitor-down; }
    Mod+Alt+K                                         { focus-monitor-up; }
    Mod+Alt+L                                         { focus-monitor-right; }

    Mod+Alt+Ctrl+H                                    { move-workspace-to-monitor-left; }
    Mod+Alt+Ctrl+J                                    { move-workspace-to-monitor-down; }
    Mod+Alt+Ctrl+K                                    { move-workspace-to-monitor-up; }
    Mod+Alt+Ctrl+L                                    { move-workspace-to-monitor-right; }

    Mod+WheelScrollDown               cooldown-ms=150 { focus-workspace-down; }
    Mod+WheelScrollUp                 cooldown-ms=150 { focus-workspace-up; }
    Mod+Ctrl+WheelScrollDown          cooldown-ms=150 { move-workspace-down; }
    Mod+Ctrl+WheelScrollUp            cooldown-ms=150 { move-workspace-up; }

    Mod+Shift+WheelScrollDown         cooldown-ms=150 { focus-column-right; }
    Mod+Shift+WheelScrollUp           cooldown-ms=150 { focus-column-left; }
    Mod+Ctrl+Shift+WheelScrollDown    cooldown-ms=150 { move-column-right; }
    Mod+Ctrl+Shift+WheelScrollUp      cooldown-ms=150 { move-column-left; }

    Mod+TouchpadScrollDown            cooldown-ms=150 { focus-workspace-down; }
    Mod+TouchpadScrollUp              cooldown-ms=150 { focus-workspace-up; }
    Mod+Ctrl+TouchpadScrollDown       cooldown-ms=150 { move-workspace-down; }
    Mod+Ctrl+TouchpadScrollUp         cooldown-ms=150 { move-workspace-up; }

    Mod+Shift+TouchpadScrollDown      cooldown-ms=150 { focus-column-right; }
    Mod+Shift+TouchpadScrollUp        cooldown-ms=150 { focus-column-left; }
    Mod+Ctrl+Shift+TouchpadScrollDown cooldown-ms=150 { move-column-right; }
    Mod+Ctrl+Shift+TouchpadScrollUp   cooldown-ms=150 { move-column-left; }

    Mod+1                                             { focus-workspace 1; }
    Mod+2                                             { focus-workspace 2; }
    Mod+3                                             { focus-workspace 3; }
    Mod+4                                             { focus-workspace 4; }
    Mod+5                                             { focus-workspace 5; }
    Mod+6                                             { focus-workspace 6; }
    Mod+7                                             { focus-workspace 7; }
    Mod+8                                             { focus-workspace 8; }
    Mod+9                                             { focus-workspace 9; }
    Mod+Ctrl+1                                        { move-column-to-workspace 1; }
    Mod+Ctrl+2                                        { move-column-to-workspace 2; }
    Mod+Ctrl+3                                        { move-column-to-workspace 3; }
    Mod+Ctrl+4                                        { move-column-to-workspace 4; }
    Mod+Ctrl+5                                        { move-column-to-workspace 5; }
    Mod+Ctrl+6                                        { move-column-to-workspace 6; }
    Mod+Ctrl+7                                        { move-column-to-workspace 7; }
    Mod+Ctrl+8                                        { move-column-to-workspace 8; }
    Mod+Ctrl+9                                        { move-column-to-workspace 9; }

    Mod+Tab                                           { focus-workspace-previous; }

    Mod+Comma                                         { consume-or-expel-window-left; }
    Mod+Period                                        { consume-or-expel-window-right; }

    Mod+M                                             { switch-preset-column-width; }
    Mod+Shift+M                                       { switch-preset-window-height; }
    Mod+Ctrl+M                                        { reset-window-height; }

    Mod+F                                             { maximize-column; }
    Mod+Shift+F                                       { fullscreen-window; }
    Mod+Ctrl+F                                        { expand-column-to-available-width; }

    Mod+Shift+C                                       { center-column; }

    Mod+0                                             { set-column-width  "-10%"; }
    Mod+Plus                                          { set-column-width  "+10%"; }
    Mod+Shift+0                                       { set-window-height "-10%"; }
    Mod+Shift+Plus                                    { set-window-height "+10%"; }

    Mod+V                                             { toggle-window-floating; }
    Mod+Shift+V                                       { switch-focus-between-floating-and-tiling; }

    Mod+E                                             { toggle-column-tabbed-display; }

    XF86AudioRaiseVolume       allow-when-locked=true { spawn-sh "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@ 0.1+"; }
    XF86AudioLowerVolume       allow-when-locked=true { spawn-sh "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@ 0.1-"; }
    XF86AudioMute              allow-when-locked=true { spawn-sh "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@ toggle"; }
    XF86AudioMicMute           allow-when-locked=true { spawn-sh "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@ toggle"; }

    XF86MonBrightnessUp        allow-when-locked=true { spawn-sh ""/*BRIGHTNESSCTL_INCREASE*/; }
    XF86MonBrightnessDown      allow-when-locked=true { spawn-sh ""/*BRIGHTNESSCTL_DECREASE*/; }
}
''
