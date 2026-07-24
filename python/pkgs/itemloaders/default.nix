{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  w3lib,
  parsel,
  jmespath,
  itemadapter,
}:

buildPythonPackage rec {
  pname = "itemloaders";
  version = "1.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scrapy";
    repo = "itemloaders";
    tag = "v${version}";
    hash = "sha256-Hs3FodJAWZGeo+kMmcto5WW433RekwVuucaJl8TKc+0=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
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
    maintainers = [ ];
  };
}
