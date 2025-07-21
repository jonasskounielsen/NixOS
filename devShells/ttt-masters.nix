{ pkgs }:
let
    inherit (pkgs) lib stdenv;
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
    NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
        pkgs.stdenv.cc.cc
    ];
    NIX_LD = builtins.readFile "${stdenv.cc}/nix-support/dynamic-linker";
}
