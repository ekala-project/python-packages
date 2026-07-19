{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "inifile";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2eXrRwjr8TNTxM/OeYrUeJCovMX7rgRjAiPRXXn1XpY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "inifile" ];

  meta = {
    description = "Small INI library for Python";
    homepage = "https://github.com/mitsuhiko/python-inifile";
    license = lib.licenses.bsd0;
  };
}
