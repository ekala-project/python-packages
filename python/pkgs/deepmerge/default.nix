{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "deepmerge";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NbOaTLks8yjW7KYcu/ZfaKN8LOswhfD4U8uy5SpZ/CM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "deepmerge" ];

  meta = {
    description = "Toolset to deeply merge python dictionaries";
    homepage = "https://github.com/toumorokoshi/deepmerge";
    license = lib.licenses.mit;
  };
}
