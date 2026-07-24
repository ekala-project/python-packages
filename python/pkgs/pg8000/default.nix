{
  lib,
  buildPythonPackage,
  fetchPypi,
  python-dateutil,
  scramp,
  hatchling,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pg8000";
  version = "1.31.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RuuwO+UrenfAPHJcedosooHW6PWVd8pmsXyQCWGMrng=";
  };

  postPatch = ''
    # Upstream uses versioningit to set the version
    sed -i "/versioningit >=/d" pyproject.toml
    sed -i '/^name =.*/a version = "${version}"' pyproject.toml
    sed -i "/dynamic =/d" pyproject.toml
  '';

  build-system = [
    hatchling
    setuptools
  ];

  dependencies = [
    python-dateutil
    scramp
  ];

  # Tests require a running PostgreSQL instance
  doCheck = false;

  pythonImportsCheck = [ "pg8000" ];

  meta = {
    description = "Python driver for PostgreSQL";
    homepage = "https://github.com/tlocke/pg8000";
    license = with lib.licenses; [ bsd3 ];
    platforms = lib.platforms.unix;
  };
}
