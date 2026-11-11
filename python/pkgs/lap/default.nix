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
  version = "0.5.14";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-BkiL6yVmSaKR3B2LvRGSDI3HDD5hBXZF9oExxHmipUk=";
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
