{ pkgs, ...}:
/* kdl */ ''
window-rule {
    match app-id="kitty"

    default-column-width  { proportion 0.25; }
}

window-rule {
    match app-id="signal"

    default-column-width  { proportion 1.00; }
    default-window-height { proportion 0.90; }
}
''
