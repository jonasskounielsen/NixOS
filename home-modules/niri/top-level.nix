{ pkgs, ... }:
/* kdl */ ''
spawn-at-startup "waybar"
spawn-sh-at-startup "(awww-daemon &) && sleep 0.3 && awww img '/home/jonas/Onedrive-personlig/Bilder/Screenshots/Skærmbillede 2024-08-23 210343.png'"

hotkey-overlay {
    skip-at-startup
}

// prefer-no-csd

screenshot-path "~/Downloads/Screenshot from %Y-%m-%d %H-%M-%S.png"

cursor {
    hide-after-inactive-ms 1000
}

environment {
    // Environment variables.
}

overview {
    zoom 0.15
}

xwayland-satellite {
    path "${pkgs.xwayland-satellite}/bin/xwayland-satellite"
}

animations {

}

gestures {
    hot-corners {
        off
    }
}
''
