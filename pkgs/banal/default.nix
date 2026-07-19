{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "banal";
  version = "1.0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-L+AskwX1MWhEGUj0oD37+i6sxz2zDbSpMwkIPLDiUKU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "banal" ];

  meta = {
    description = "Commons of banal micro-functions for Python";
    homepage = "https://github.com/pudo/banal";
    license = lib.licenses.mit;
  };
}
