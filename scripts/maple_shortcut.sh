function maple() {
    export GDK_BACKEND=x11
    export _JAVA_AWT_WM_NONREPARENTING=1
    distrobox-enter maple -- "$HOME"/maple2025/bin/xmaple
    export GDK_BACKEND=""
    export _JAVA_AWT_WM_NONREPARENTING=""
}
