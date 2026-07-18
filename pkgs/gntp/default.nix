{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "gntp";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9KTyAJ7Li7QaGq3dX7fAMIeyoUysLAOvApugS5Fm2uA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "gntp" ];

  meta = {
    description = "Python library for working with the Growl Notification Transport Protocol";
    homepage = "https://github.com/kfdm/gntp/";
    license = lib.licenses.mit;
  };
}
