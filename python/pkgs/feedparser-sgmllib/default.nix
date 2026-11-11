{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "feedparser-sgmllib";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "feedparser_sgmllib";
    inherit (finalAttrs) version;
    hash = "sha256-YfrPKRjEOJtbAHFPdsXgNDH/zZTNH1HWV+3WzXw5ZXk=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "feedparser_sgmllib" ];

  meta = {
    description = "sgmllib from Python 2.7, for feedparser use only";
    homepage = "https://github.com/python-syndication/feedparser-sgmllib";
    license = lib.licenses.psfl;
  };
})
