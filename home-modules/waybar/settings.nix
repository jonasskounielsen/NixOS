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
      "network"
      "bluetooth"
      "backlight"
      "pulseaudio"
      "battery"
    ];

    modules-left = [
      "niri/workspaces"
    ];
    
    backlight = {
      format = "{icon}{percent}%";
      format-icons = [
        "󰃜 "
        "󰃛 "
        "󰃚 "
      ];
    };

    bluetooth = {
      format = "󰂯 {status} - Devices: {num_connections}";
      format-disabled = "󰂲 {status}";
      format-connected = "󰥰  {status} - Devices: {num_connections}";
      format-connected-battery = "󰥰  status - {device_battery_percentage}% - Devices: {num_connections}";
      on-click = "blueman-manager";
    };

    network = {
      interval = 1;
      family = "ipv4-6";
      format = "{icon}{essid}";
      format-alt = "{icon}{essid}";
      format-wifi = "{icon}{essid} -  {bandwidthDownBits}   {bandwidthUpBits} ";
      format-ethernet = "󰈀 {essid} -  {bandwidthDownBits}   {bandwidthUpBits} ";
      format-disconnected = "󰤭 - No WIFI";
      format-icons = [
        "󰤯 "
	"󰤟 "
	"󰤢 "
	"󰤥 "
	"󰤨 "
      ];
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-bluetooth = "󰋎 {volume}%"; 
      format-muted = "";
      format-icons = [
        "󰕿"
        "󰖀"
        "󰕾"
      ];
    };

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
        on-click-forward = "tz-up";
        on-click-backward = "tz-down";
        on-scroll-up = "shift-up";
        on-scroll-down = "shift-down";
      };
    };

    battery = {
      format = "{capacity}% {icon}";
      states = {
        warning = 20;
        critical = 10;
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
