{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "funcy";
  version = "2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OWMxXVnUHG8wwEvJEOEKtQo6xKIlhov6lv7tEz3wdcs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "funcy" ];

  meta = {
    homepage = "https://funcy.readthedocs.org/";
    description = "Collection of fancy functional tools focused on practicality";
    license = lib.licenses.bsd3;
  };
}
