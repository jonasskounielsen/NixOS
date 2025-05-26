{ pkgs }:

builtins.trace pkgs pkgs.mkShell {
    # nativeBuildInputs = with pkgs; [

    # ];

    shellHook = ''
        echo "test"
    '';
}
