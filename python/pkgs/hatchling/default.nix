{
  lib,
  buildPythonPackage,
  fetchPypi,

  # runtime
  editables,
  packaging,
  pathspec,
  pluggy,
  tomlkit,
  trove-classifiers,

  # tests
  build,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "hatchling";
  version = "1.33.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TEIr1NVU/P9d5bc+lZb4XkHp+X9+VT2PdZXssxpie+8=";
  };

  # listed in backend/pyproject.toml
  dependencies = [
    editables
    packaging
    pathspec
    pluggy
    tomlkit
    trove-classifiers
  ];

  pythonImportsCheck = [
    "hatchling"
    "hatchling.build"
  ];

  # tries to fetch packages from the internet

  # listed in /backend/tests/downstream/requirements.txt
  checkPhase = ''
    runHook preCheck
    ${python.interpreter} tests/downstream/integrate.py
    runHook postCheck
  '';

  meta = {
    description = "Modern, extensible Python build backend";
    mainProgram = "hatchling";
    homepage = "https://hatch.pypa.io/latest/";
    license = lib.licenses.mit;
  };
})
