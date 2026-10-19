{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "timelib";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0bInBlVxhuYFjaiLoPhYN0AbKuneFX9ZNT3JeNglGHo=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];

  meta = {
    description = "Parse english textual date descriptions";
    homepage = "https://github.com/pediapress/timelib/";
    license = lib.licenses.zlib;
  };
}
