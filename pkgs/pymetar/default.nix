{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pymetar";
  version = "1.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SNvmxJKZYQIcth5Ju54GBbVMS2G5+5reUQdnBaCOzVQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pymetar" ];

  meta = {
    description = "Command-line tool to show the weather report by a given station ID";
    homepage = "https://github.com/klausman/pymetar";
    license = lib.licenses.gpl2Plus;
  };
}
