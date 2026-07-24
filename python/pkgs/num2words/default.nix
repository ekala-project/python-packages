{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  docopt,
}:

buildPythonPackage rec {
  pname = "num2words";
  version = "0.5.14";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sGbsGOVrZhajs4CGtXR9qvuqiGiyJqNhJ+BFHAzzecY=";
  };

  build-system = [ setuptools ];

  dependencies = [ docopt ];

  pythonImportsCheck = [ "num2words" ];

  meta = {
    description = "Modules to convert numbers to words";
    homepage = "https://github.com/savoirfairelinux/num2words";
    license = lib.licenses.lgpl21;
  };
}
