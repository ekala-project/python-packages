{
  lib,
  buildPythonPackage,
  fetchPypi,
  cython,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "openstep-plist";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    pname = "openstep_plist";
    inherit version;
    hash = "sha256-Kg1w/3oDzOZKcnBitkuy9cmvn9SmNqqkM5tqqiz2UZU=";
  };

  build-system = [
    cython
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "openstep_plist" ];

  meta = {
    description = "Parser for the 'old style' OpenStep property list format";
    homepage = "https://github.com/fonttools/openstep-plist";
    license = lib.licenses.mit;
  };
}
