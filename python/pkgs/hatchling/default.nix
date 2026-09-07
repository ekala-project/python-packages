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
  version = "1.32.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-C9veSlKwbDfj7KOV+Fp2K/DvBv43T9iuQp3GvhAjD18=";
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
