{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "text-unidecode";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "bad6603bb14d279193107714b288be206cac565dfa49aa5b105294dd5c4aab93";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Most basic Text::Unidecode port";
    homepage = "https://github.com/kmike/text-unidecode";
    license = lib.licenses.artistic1;
  };
})
