{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
  udev,
  stdenvNoCC,
}:

buildPythonPackage rec {
  pname = "pyudev";
  version = "0.24.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-54i7mDcAsahO/C6IhisKUa8qmV1bhryZl1RlBc97Nrw=";
  };

  postPatch = lib.optionalString stdenvNoCC.hostPlatform.isLinux ''
    substituteInPlace src/pyudev/_ctypeslib/utils.py \
      --replace "find_library(name)" "'${lib.getLib udev}/lib/libudev.so'"
  '';

  build-system = [ setuptools ];

  dependencies = [ six ];

  doCheck = false;

  pythonImportsCheck = [ "pyudev" ];

  meta = {
    description = "Pure Python libudev binding";
    homepage = "https://pyudev.readthedocs.org/";
    license = lib.licenses.lgpl21Plus;
  };
}
