{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "cymem";
  version = "2.0.14";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "cymem";
    tag = "release-v${finalAttrs.version}";
    hash = "sha256-pb7AWkCOLfoH2kLNNwIxxHyGsxCpq72Qzid4aCYu9XM=";
  };

  build-system = [
    setuptools
    cython
  ];
  pythonImportsCheck = [ "cymem" ];

  meta = {
    description = "Cython memory pool for RAII-style memory management";
    homepage = "https://github.com/explosion/cymem";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
