{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  versioneer,
}:

buildPythonPackage rec {
  pname = "constantly";
  version = "23.10.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qpK3CjPirAuzPNdF62F3ZZTcSHZLBsNeDv0FC38cfL0=";
  };

  nativeBuildInputs = [
    setuptools
    versioneer
  ];

  doCheck = false;

  pythonImportsCheck = [ "constantly" ];

  meta = {
    description = "Module for symbolic constant support";
    homepage = "https://github.com/twisted/constantly";
    license = lib.licenses.mit;
  };
}
