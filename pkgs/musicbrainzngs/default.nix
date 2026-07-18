{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "musicbrainzngs";
  version = "0.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qxwBAP0LMFhS5l8u1BE8beEuaK/VUYaYe47Zfg+Y5ic=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "musicbrainzngs" ];

  meta = {
    description = "Python bindings for musicbrainz NGS webservice";
    homepage = "https://python-musicbrainzngs.readthedocs.org/";
    license = lib.licenses.bsd2;
  };
}
