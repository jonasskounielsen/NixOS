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
        vulkan-tools
        vulkan-loader
        vulkan-headers
        vulkan-validation-layers
        shaderc
    ];
    LD_LIBRARY_PATH = lib.makeLibraryPath (with pkgs; [
        vulkan-loader
    ]);
    SHADERC_LIB_DIR = lib.makeLibraryPath (with pkgs; [
        shaderc
    ]);
}

