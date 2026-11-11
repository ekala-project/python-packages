{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
  udev,
  stdenvNoCC,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyudev";
  version = "0.24.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Tn+q7EGbgakC0FdWgQGBn0SJcsDPRIu5wiID5Pxqjrk=";
  };

  postPatch = lib.optionalString stdenvNoCC.hostPlatform.isLinux ''
    substituteInPlace src/pyudev/_ctypeslib/utils.py \
      --replace "find_library(name)" "'${lib.getLib udev}/lib/libudev.so'"
  '';

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "pyudev" ];

  meta = {
    description = "Pure Python libudev binding";
    homepage = "https://pyudev.readthedocs.org/";
    license = lib.licenses.lgpl21Plus;
  };
})
