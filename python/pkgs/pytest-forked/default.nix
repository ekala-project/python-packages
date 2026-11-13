{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  py,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-forked";
  version = "1.7.5";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_forked";
    inherit (finalAttrs) version;
    hash = "sha256-APK+5RYS8puOa4Hu0sOyl16CTCaTOU9b2vehNpB4ul8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    py
    pytest
  ];

  pythonImportsCheck = [ "pytest_forked" ];

  meta = {
    description = "Run tests in isolated forked subprocesses";
    homepage = "https://github.com/pytest-dev/pytest-forked";
    license = lib.licenses.mit;
  };
})
