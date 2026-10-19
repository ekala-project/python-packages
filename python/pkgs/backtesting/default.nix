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

buildPythonPackage (finalAttrs: {
  pname = "backtesting";
  version = "0.6.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hErxHJYfoPR7/dsEtEhBb5OwK3Mfqt+j34uYpECB/Qs=";
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

  meta = {
    description = "Backtest trading strategies in Python";
    homepage = "https://kernc.github.io/backtesting.py/";
    license = lib.licenses.agpl3Only;
  };
})
