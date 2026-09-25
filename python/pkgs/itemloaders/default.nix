{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  w3lib,
  parsel,
  jmespath,
  itemadapter,
}:

buildPythonPackage rec {
  pname = "itemloaders";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scrapy";
    repo = "itemloaders";
    tag = "v${version}";
    hash = "sha256-pHCvtiBtTgO2y3GUPFc0o9CcCtIMqluRXEJ2tl/tcwA=";
  };

  build-system = [ hatchling ];

  dependencies = [
    w3lib
    parsel
    jmespath
    itemadapter
  ];
  pythonImportsCheck = [ "itemloaders" ];

  meta = {
    description = "Library to populate items using XPath and CSS with a convenient API";
    homepage = "https://github.com/scrapy/itemloaders";
    license = lib.licenses.bsd3;
  };
}
