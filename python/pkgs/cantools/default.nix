{
  lib,
  argparse-addons,
  bitstruct,
  buildPythonPackage,
  python-can,
  crccheck,
  diskcache,
  fetchPypi,
  matplotlib,
  setuptools,
  setuptools-scm,
  textparser,
}:

buildPythonPackage (finalAttrs: {
  pname = "cantools";
  version = "45.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yfkFmukCiQIGXV/ER4codJ4ngV9VSOaySfljNQ2BLo4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    argparse-addons
    bitstruct
    python-can
    crccheck
    diskcache
    textparser
  ];

  optional-dependencies.plot = [ matplotlib ];

  pythonImportsCheck = [ "cantools" ];

  meta = {
    description = "Tools to work with CAN bus";
    homepage = "https://github.com/cantools/cantools";
    license = lib.licenses.mit;
    mainProgram = "cantools";
  };
})
