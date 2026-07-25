{
  lib,
  buildPythonPackage,
  fetchPypi,

  # runtime
  editables,
  packaging,
  pathspec,
  pluggy,
  trove-classifiers,

  # tests
  build,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "hatchling";
  version = "1.31.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-a0itQGikgu1yObOoIVvFW0eq0zRdWN/JTlU8XS1GIRs=";
  };

  # listed in backend/pyproject.toml
  dependencies = [
    editables
    packaging
    pathspec
    pluggy
    trove-classifiers
  ];

  pythonImportsCheck = [
    "hatchling"
    "hatchling.build"
  ];

  # tries to fetch packages from the internet
  doCheck = false;

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
    maintainers = [ ];
  };
})
