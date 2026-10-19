{
  lib,
  buildPythonPackage,
  fetchPypi,
  pefile,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "autoit-ripper";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-+BHWDkeVewoRUgaHln5TyoajpCvJiowCiC2dFYyp1MA=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ pefile ];

  # Project has no tests

  pythonImportsCheck = [ "autoit_ripper" ];

  meta = {
    description = "Python module to extract AutoIt scripts embedded in PE binaries";
    mainProgram = "autoit-ripper";
    homepage = "https://github.com/nazywam/AutoIt-Ripper";
    license = lib.licenses.mit;
  };
})
