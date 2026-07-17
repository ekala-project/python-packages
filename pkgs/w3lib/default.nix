{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "w3lib";
  version = "2.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jdae45/2OY1wjHk6vHecM0ppusfO4c33FzbGae1r6GQ=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "w3lib" ];

  meta = {
    homepage = "https://github.com/scrapy/w3lib";
    description = "Library of web-related functions";
    license = lib.licenses.bsd3;
  };
}
