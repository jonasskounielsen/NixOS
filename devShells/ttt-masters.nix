{ pkgs }:
let
    inherit (pkgs) lib;
in
pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        cargo
        rustc
        rustfmt
        rustPackages.clippy
        libgcc
        gdb
    ];
    LD_LIBRARY_PATH = lib.makeLibraryPath [
        pkgs.stdenv.cc.cc
    ];
}
