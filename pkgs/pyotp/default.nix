{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyotp";
  version = "2.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NGtmQuDb3eO0/1qTC2ZMqCq/oRY1btSMxCx9ZZDTb2M=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyotp" ];

  meta = {
    homepage = "https://github.com/pyauth/pyotp";
    description = "Python One Time Password Library";
    license = lib.licenses.mit;
  };
}
