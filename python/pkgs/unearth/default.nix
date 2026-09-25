{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  packaging,
  pdm-backend,
  httpx,
  flask,
  pytest-httpserver,
  pytest-mock,
  requests-wsgi-adapter,
  trustme,
}:

buildPythonPackage rec {
  pname = "unearth";
  version = "0.18.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FAZ88RQckG94fW2dBwy8/dRD/RBYrsqmUM6VGaoQ29w=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    packaging
    httpx
  ];
  pythonImportsCheck = [ "unearth" ];

  meta = {
    description = "Utility to fetch and download Python packages";
    mainProgram = "unearth";
    homepage = "https://github.com/frostming/unearth";
    license = lib.licenses.mit;
  };
}
