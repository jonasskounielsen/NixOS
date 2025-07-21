{ pkgs }:

pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        cargo
        rustc
        rustfmt
        rustPackages.clippy
        libgcc
    ];
}
