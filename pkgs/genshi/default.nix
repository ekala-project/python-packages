{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "genshi";
  version = "0.7.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hbDbETYlMU8PRPP+bvDrJWTWw03S7lZ3tJXRUUK7SXM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "genshi" ];

  meta = {
    description = "Python components for parsing HTML, XML and other textual content";
    homepage = "https://genshi.edgewall.org/";
    license = lib.licenses.bsd0;
  };
}
