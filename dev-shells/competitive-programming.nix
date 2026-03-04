{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gcc
    gdb
  ];
}
