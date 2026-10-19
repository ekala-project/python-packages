{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  numpy,
  python-utils,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "lap";
  version = "0.5.13";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nv9xaePKRSmVrwSTzCDTVFLEv9BhIsNsBkVxGf+9QRs=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];

  dependencies = [
    numpy
    python-utils
  ];
  pythonImportsCheck = [ "lap" ];
  # See https://github.com/NixOS/nixpkgs/issues/255262
  meta = {
    description = "Linear Assignment Problem solver (LAPJV/LAPMOD)";
    homepage = "https://github.com/gatagat/lap";
    license = lib.licenses.bsd2;
  };
})
