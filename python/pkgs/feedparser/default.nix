{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  feedparser-sgmllib,
}:

buildPythonPackage (finalAttrs: {
  pname = "feedparser";
  version = "6.0.14";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-CIZ5sMS1Q+4hGoIN1URpjHakAhIurnRzwEpDQl8oPQY=";
  };

  build-system = [ setuptools ];

  dependencies = [ feedparser-sgmllib ];

  pythonImportsCheck = [ "feedparser" ];

  meta = {
    description = "Universal feed parser";
    homepage = "https://github.com/kurtmckee/feedparser";
    license = lib.licenses.bsd2;
  };
})
