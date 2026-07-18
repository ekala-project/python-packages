{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  pytest,

  # dependencies
  cryptography,
}:

buildPythonPackage rec {
  pname = "py-vapid";
  version = "1.9.4";
  pyproject = true;

  src = fetchPypi {
    pname = "py_vapid";
    inherit version;
    hash = "sha256-oAQCNWDLxU40/AY4CgWA8E/8x4joT7bRnpM57rZVGig=";
  };

  build-system = [
    hatchling
    pytest
  ];

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "py_vapid" ];

  meta = {
    description = "Library for VAPID header generation";
    homepage = "https://github.com/mozilla-services/vapid";
    license = lib.licenses.mpl20;
  };
}
