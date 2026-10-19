{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "onetimepad";
  version = "1.4";

  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1eaade76d8036e1cb79e944b75874bfe5ee4046a571c0724564e1721565c73fd";
  };

  build-system = [ setuptools ];

  # upstream has no tests

  pythonImportsCheck = [ "onetimepad" ];

  meta = {
    description = "Hacky implementation of one-time pad";
    mainProgram = "onetimepad";
    homepage = "https://jailuthra.in/onetimepad";
    license = lib.licenses.mit;
  };
}
