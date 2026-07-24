{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mslex";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZByIfR09thDu4q83qOWr2j9wswBs39LQ0p3A0a4oqF0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mslex" ];

  meta = {
    description = "Like shlex, but for windows";
    homepage = "https://github.com/smoofra/mslex";
    license = lib.licenses.asl20;
  };
}
