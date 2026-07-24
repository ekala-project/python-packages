{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pypeg2";
  version = "2.15.2";
  pyproject = true;

  src = fetchPypi {
    pname = "pyPEG2";
    inherit version;
    hash = "sha256-Ky1PgNjhqTcLKpH0ol9Kv39puFyNqEzSPsNkUZWKH20=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "pypeg2" ];

  meta = {
    description = "PEG parser interpreter in Python";
    homepage = "http://fdik.org/pyPEG";
    license = lib.licenses.gpl2;
  };
}
