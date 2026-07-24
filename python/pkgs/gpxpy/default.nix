{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  lxml,
}:

buildPythonPackage rec {
  pname = "gpxpy";
  version = "1.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pyxIS5fsQrgINDU7ApzI7ht58P/KEXmyIQuzuvJsAa4=";
  };

  build-system = [ setuptools ];

  dependencies = [ lxml ];

  pythonImportsCheck = [ "gpxpy" ];

  meta = {
    description = "Python GPX (GPS eXchange format) parser";
    mainProgram = "gpxinfo";
    homepage = "https://github.com/tkrajina/gpxpy";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
  };
}
