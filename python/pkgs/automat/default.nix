{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  hatch-vcs,
  attrs,
}:

buildPythonPackage rec {
  pname = "automat";
  version = "25.4.16";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ABdZGlR3Bm6Q0msOaW3cFDuq/Ye1iM+sgQC8a+ljTeA=";
  };

  build-system = [
    setuptools
    hatch-vcs
  ];

  dependencies = [ attrs ];

  pythonImportsCheck = [ "automat" ];

  meta = {
    homepage = "https://github.com/glyph/Automat";
    description = "Self-service finite-state machines for the programmer on the go";
    license = lib.licenses.mit;
  };
}
