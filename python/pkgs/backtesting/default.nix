{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  numpy,
  pandas,
  bokeh,
}:

buildPythonPackage rec {
  pname = "backtesting";
  version = "0.6.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-c4od7ij8U98u2jXqLy0aHDfdugHfFCI/yeh9gKHvvC4=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "'setuptools_git'," ""
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    numpy
    pandas
    bokeh
  ];

  # No tests
  doCheck = false;

  meta = {
    description = "Backtest trading strategies in Python";
    homepage = "https://kernc.github.io/backtesting.py/";
    license = lib.licenses.agpl3Only;
    maintainers = [ ];
  };
}
