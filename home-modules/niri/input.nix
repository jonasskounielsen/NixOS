{ pkgs, ... }:
/* kdl */ ''
input {
    keyboard {
        xkb {

        }

        numlock
    }

    touchpad {
        tap
        natural-scroll
    }

    mouse {

    }
    
    disable-power-key-handling
    
    focus-follows-mouse max-scroll-amount="100%"

    workspace-auto-back-and-forth
}
''
