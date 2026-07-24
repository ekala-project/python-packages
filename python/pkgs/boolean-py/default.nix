{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "boolean-py";
  version = "5.0";
  pyproject = true;

  src = fetchPypi {
    pname = "boolean_py";
    inherit version;
    hash = "sha256-YMvEutB5dTch0yZJVFUFNix1ThIVcK2kZYuFKjoxjZU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "boolean" ];

  meta = {
    description = "Implements boolean algebra in one module";
    homepage = "https://github.com/bastikr/boolean.py";
    license = lib.licenses.bsd2;
  };
}
