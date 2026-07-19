{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "itemadapter";
  version = "0.13.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+hOce+KqgPiHSy8j0WXV1KpHxLhcVKtTC1Z/1faE8bQ=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "itemadapter" ];

  meta = {
    description = "Common interface for data container classes";
    homepage = "https://github.com/scrapy/itemadapter";
    license = lib.licenses.bsd3;
  };
}
