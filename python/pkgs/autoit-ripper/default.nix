{
  lib,
  buildPythonPackage,
  fetchPypi,
  pefile,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "autoit-ripper";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "autoit_ripper";
    inherit (finalAttrs) version;
    hash = "sha256-IOnDiCDbFDpPl24qFloEME/b0qHPGrJgef3kC61wpHk=";
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
