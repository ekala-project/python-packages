{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "genshi";
  version = "0.7.12";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-S8ohpaJRXav5hRdr6Jels7YkYmtKn8tkhyC3xfq3Fic=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "genshi" ];

  meta = {
    description = "Python components for parsing HTML, XML and other textual content";
    homepage = "https://genshi.edgewall.org/";
    license = lib.licenses.bsd0;
  };
})
