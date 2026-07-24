{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyuca";
  version = "1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ijgv50Yn8IwNGJCMBxPKSiCq1ThfB3V55WIIvuook7I=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "pyuca" ];

  meta = {
    homepage = "https://github.com/jtauber/pyuca";
    description = "Python implementation of the Unicode Collation Algorithm";
    license = lib.licenses.mit;
  };
}
