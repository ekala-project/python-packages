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
  version = "43.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-z+yOIAG0boxLYmCq2qKG51SWxEbq606jhA14EyLtz8c=";
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
