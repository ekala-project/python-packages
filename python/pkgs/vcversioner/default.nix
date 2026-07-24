{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "vcversioner";
  version = "2.16.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2uYMF6R5eB9EpAEHAYM/GCkUCx7szSWHYqdJdKoG4Zs=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Take version numbers from version control";
    homepage = "https://github.com/habnabit/vcversioner";
    license = lib.licenses.isc;
  };
}
