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

buildPythonPackage rec {
  pname = "parsel";
  version = "1.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WSX+CH6xb8QEp+2R4x4sHiqbIw2ktk802BNYwNDifog=";
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
}
