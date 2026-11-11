{
  buildPythonPackage,
  lib,
  fetchPypi,
  setuptools,
  headerkit,
  click,
  pytestCheckHook,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-autopxd2";
  version = "4.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "autopxd2";
    inherit (finalAttrs) version;
    hash = "sha256-vAC3+SxD8/Un9mbzU2qULSStfM/vrlz+qVZKMgA2UV0=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    click
    headerkit
  ];

  nativeCheckInputs = [
    cython
    pytestCheckHook
  ];

  disabledTestMarks = [
    # downloads headers at runtime
    "real_headers"
    # needs clang2 python module
    "libclang"
  ];

  pythonImportsCheck = [ "autopxd" ];

  enabledTestPaths = [
    "test/"
  ];

  meta = {
    homepage = "https://github.com/elijahr/python-autopxd2";
    mainProgram = "autopxd";
    license = lib.licenses.mit;
    description = "Generates .pxd files automatically from .h files";
  };
})
