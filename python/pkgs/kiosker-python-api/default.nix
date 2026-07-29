{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx,
}:

buildPythonPackage (finalAttrs: {
  pname = "kiosker-python-api";
  version = "1.2.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Top-North";
    repo = "kiosker-python";
    tag = finalAttrs.version;
    hash = "sha256-DGJ1lxi4pP4gyRWDpeUdyPGCKQmzpRaWw8bwHrFUKF0=";
  };

  build-system = [ hatchling ];

  dependencies = [ httpx ];

  # Tests require a live Kiosker device (HOST/TOKEN env vars).
  doCheck = false;

  pythonImportsCheck = [ "kiosker" ];

  meta = {
    description = "Python wrapper for the Kiosker API";
    homepage = "https://github.com/Top-North/kiosker-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
