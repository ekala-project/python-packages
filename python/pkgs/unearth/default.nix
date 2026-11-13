{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  packaging,
  pdm-backend,
  httpx2,
  flask,
  pytest-httpserver,
  pytest-mock,
  requests-wsgi-adapter,
  trustme,
}:

buildPythonPackage (finalAttrs: {
  pname = "unearth";
  version = "0.19.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-2Fp7FkgzwdyFMqWQBDy9cVn2rSuR/D508qFv8l7QmMg=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    packaging
    httpx2
  ];
  pythonImportsCheck = [ "unearth" ];

  meta = {
    description = "Utility to fetch and download Python packages";
    mainProgram = "unearth";
    homepage = "https://github.com/frostming/unearth";
    license = lib.licenses.mit;
  };
})
