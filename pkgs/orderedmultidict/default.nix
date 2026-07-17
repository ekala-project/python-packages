{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "orderedmultidict";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BAcLu16HKRzJv6Ud9BNnf68hQcc8YdKl97Jr6jzYgq0=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  doCheck = false;

  pythonImportsCheck = [ "orderedmultidict" ];

  meta = {
    homepage = "https://github.com/gruns/orderedmultidict";
    description = "Ordered Multivalue Dictionary";
    license = lib.licenses.unlicense;
  };
}
