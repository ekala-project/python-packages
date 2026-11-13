{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  python-dateutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "croniter";
  version = "7.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-oLJWgwPHdPak6i1M4ucrHukRApxwcNZKG+/gXNsQf1o=";
  };

  # upstream pins exact versions of build-system dependencies
  postPatch = ''
    sed -i '/^\[build-system\]/,/^build-backend/c\[build-system]\nrequires = ["hatchling"]\nbuild-backend = "hatchling.build"' pyproject.toml
  '';

  build-system = [ hatchling ];

  dependencies = [ python-dateutil ];

  pythonImportsCheck = [ "croniter" ];

  meta = {
    description = "Library to iterate over datetime object with cron like format";
    homepage = "https://github.com/pallets-eco/croniter";
    license = lib.licenses.mit;
  };
})
