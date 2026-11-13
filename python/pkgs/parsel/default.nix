{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  cssselect,
  jmespath,
  lxml,
  packaging,
  w3lib,
}:

buildPythonPackage (finalAttrs: {
  pname = "parsel";
  version = "1.12.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-9SbfhG86keE/VJkVbqPnVRFINM0Sa2LNHXhO9VjzpxM=";
  };

  build-system = [ hatchling ];

  dependencies = [
    cssselect
    jmespath
    lxml
    packaging
    w3lib
  ];

  pythonImportsCheck = [ "parsel" ];

  meta = {
    homepage = "https://github.com/scrapy/parsel";
    description = "Python library to extract data from HTML and XML using XPath and CSS selectors";
    license = lib.licenses.bsd3;
  };
})
