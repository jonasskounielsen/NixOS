{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    typst
  ];
}
