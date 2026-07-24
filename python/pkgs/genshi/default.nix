{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "genshi";
  version = "0.7.11";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gsT5u/SwO+UWKiTW2OT9v+PtJgLT68v1BaMzUKN53Lc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "genshi" ];

  meta = {
    description = "Python components for parsing HTML, XML and other textual content";
    homepage = "https://genshi.edgewall.org/";
    license = lib.licenses.bsd0;
  };
}
