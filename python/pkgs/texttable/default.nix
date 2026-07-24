{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "texttable";
  version = "1.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LSBo+1URWAfTrHekymj6SIA+hOuw7iNA+FgQejZSJjg=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "texttable" ];

  meta = {
    description = "Module to generate a formatted text table, using ASCII characters";
    homepage = "https://github.com/foutaise/texttable";
    license = lib.licenses.mit;
  };
}
