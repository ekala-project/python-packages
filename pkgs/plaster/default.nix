{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "plaster";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+L78VL+MEUfBCrQCl+yEwmdvotTqXW9STZQ2qAB075g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "plaster" ];

  meta = {
    description = "Loader interface around multiple config file formats";
    homepage = "https://pypi.org/project/plaster/";
    license = lib.licenses.mit;
  };
}
