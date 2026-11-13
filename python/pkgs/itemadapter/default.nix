{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "itemadapter";
  version = "0.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-unxG9DTMEn39xVsHfnJLz4hyHgu/1HL+bPjd6LzSAIs=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "itemadapter" ];

  meta = {
    description = "Common interface for data container classes";
    homepage = "https://github.com/scrapy/itemadapter";
    license = lib.licenses.bsd3;
  };
})
