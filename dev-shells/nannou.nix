{ pkgs }:
let
  inherit (pkgs) lib;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
    rustfmt
    rustPackages.clippy
    libGL
    libdrm
    xorg.libX11
    xorg.libXrandr
    xorg.libXxf86vm
    libxcb
    libxkbcommon
    vulkan-loader
    mesa
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath (with pkgs; [
    rustc
    cargo
    libGL
    libdrm
    xorg.libX11
    xorg.libXrandr
    xorg.libXxf86vm
    xorg.libXcursor
    xorg.libXi
    libxcb
    libxkbcommon
    vulkan-loader
    mesa
  ]);

  shellHook = ''
    export RUST_BACKTRACE=1
  '';
}