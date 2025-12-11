{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    typst
  ];

  shellHook = ''
    ulimit -n 8192
  ''; # Neovim may hit the file descriptor limit.
}
