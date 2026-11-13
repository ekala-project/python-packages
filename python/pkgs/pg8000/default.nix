{
  lib,
  buildPythonPackage,
  fetchPypi,
  python-dateutil,
  scramp,
  hatchling,
  versioningit,
}:

buildPythonPackage (finalAttrs: {
  pname = "pg8000";
  version = "1.31.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VTskAlbUstjwrSryjQffH5mAJH90rJjSwrVzdi7B/xs=";
  };

  build-system = [
    hatchling
    versioningit
  ];

  # Upstream pins scramp == 1.5.0
  pythonRelaxDeps = [ "scramp" ];

  dependencies = [
    python-dateutil
    scramp
  ];

  # Tests require a running PostgreSQL instance

  pythonImportsCheck = [ "pg8000" ];

  meta = {
    description = "Python driver for PostgreSQL";
    homepage = "https://github.com/tlocke/pg8000";
    license = with lib.licenses; [ bsd3 ];
    platforms = lib.platforms.unix;
  };
})
