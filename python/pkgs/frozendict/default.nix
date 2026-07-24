{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "frozendict";
  version = "2.4.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5Hj7KhORpWyKbhDMl8SpACtBDs0awowY14BmF2Licb0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "frozendict" ];

  meta = {
    homepage = "https://github.com/Marco-Sulla/python-frozendict";
    description = "Module for immutable dictionary";
    license = lib.licenses.lgpl3Only;
  };
}
