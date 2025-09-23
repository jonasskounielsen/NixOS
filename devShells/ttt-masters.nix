{ pkgs }:
let
  unfreePkgs = import pkgs.path {
    inherit (pkgs) system overlays;
    config = pkgs.config // {
      allowUnfree = true;
    };
  };
  inherit (pkgs) lib;
in
pkgs.mkShell {
  nativeBuildInputs =
    with pkgs;
    [
      cargo
      rustc
      rustfmt
      rustPackages.clippy
      libgcc
      gdb
    ]
    ++ (with unfreePkgs; [
      steam-run
    ]);
  LD_LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.stdenv.cc.cc
  ];
}
