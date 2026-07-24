{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  pytest,
  six,
}:

buildPythonPackage rec {
  pname = "pytest-remotedata";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest-remotedata";
    inherit version;
    hash = "sha256-BcCL9jjN0e1m6wFzihZHw8cUc3w+w6vgCdLB95O0u1k=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    pytest
    six
  ];

  pythonImportsCheck = [ "pytest_remotedata" ];

  meta = {
    description = "Pytest plugin for controlling remote data access";
    homepage = "https://github.com/astropy/pytest-remotedata";
    license = lib.licenses.bsd3;
  };
}
