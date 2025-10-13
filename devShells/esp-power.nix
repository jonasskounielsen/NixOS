{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    python3
    python3Packages.pyserial
    esptool
    screen
  ];
}
