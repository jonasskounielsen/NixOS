{
  mainBar = {
    height = 10;
    spacing = 5;
    layer = "top";
    position = "top";

    modules-center = [
      "clock"
    ];

    modules-right = [
      "backlight"
      "pulseaudio"
      "bluetooth"
      "network"
      "battery"
    ];

    modules-left = [
      "niri/workspaces"
    ];

    clock = {
      format = "{:%H:%M}";
      format-alt = "{:%R - %A, %B %d, %Y}";
      tooltip-format = "<tt><small>{calendar}</small></tt>";
    
      calendar = {
        mode = "year";
        mode-mon-col = 3;
        weeks-pos = "right";

      format = {
          months = "<span color='#ffead3' font-family = 'Comic Mono'><b>{}</b></span>";
          days = "<span color='#ecc6d9' font-family = 'Comic Mono'><b>{}</b></span>";
          weeks = "<span color='#99ffdd' font-family = 'Comic Mono'><b>W{}</b></span>";
          weekdays = "<span color='#ffcc66' font-family = 'Comic Mono'><b>{}</b></span>";
          today = "<span color='#ff6699' font-family = 'Comic Mono'><b><u>{}</u></b></span>";
        };
      };
    
      actions = {
        on-click-right = "mode";
        on-click-forward = "tz_up";
        on-click-backward = "tz_down";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };

    battery = {
      format = "{capacity}% {icon}";
      states = {
        warning = 40;
        critical = 20;
      };
      format-plugged = "{capacity}% 󰂄";
      format-icons = [
        "󰁺"
        "󰁻"
        "󰁼"
        "󰁽"
        "󰁾"
        "󰁿"
        "󰂀"
        "󰂁"
        "󰂂"
        "󰁹"
      ];
      tooltip = true;
    };
  };
}
