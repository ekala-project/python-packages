{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "keke";
  version = "0.3.0b3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rkMfcJvhH4XTOyCwfK70fM8dZ4nDB59urfi+FhsSPQo=";
  };

  installCheckPhase = ''
    python -m keke.tests
  '';

  nativeBuildInputs = [ setuptools-scm ];

  build-system = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [
    "keke"
  ];

  meta = {
    description = "Easy profiling in chrome trace format";
    homepage = "https://pypi.org/project/keke/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
