{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
  pytest,
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-remotedata";
  version = "0.4.3";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_remotedata";
    inherit (finalAttrs) version;
    hash = "sha256-KXFPu+rWyeUD9WHeCGbFjcedFaXLFUgLsrlTYmMlAuQ=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    pytest
    packaging
  ];

  pythonImportsCheck = [ "pytest_remotedata" ];

  meta = {
    description = "Pytest plugin for controlling remote data access";
    homepage = "https://github.com/astropy/pytest-remotedata";
    license = lib.licenses.bsd3;
  };
})
