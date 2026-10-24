{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs.python314Packages; [
    numpy
    scipy
    matplotlib
    scikit-learn
    sympy
    pandas
  ] ++ [
    jupyter
  ];

  shellHook = ''
    jupyter notebook
  '';
}
