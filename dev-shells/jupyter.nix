{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs.python314Packages; [
    numpy
    scipy
    matplotlib
    scikit-learn
    sympy
    pandas

    openpyxl

    typst
    mpl-typst
  ]) ++ (with pkgs; [
    jupyter
  ]);

  shellHook = ''
    jupyter notebook
  '';
}
