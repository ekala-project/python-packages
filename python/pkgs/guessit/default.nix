{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  rebulk,
  babelfish,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "guessit";
  version = "3.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Zhn8u/mgUQ7IwsM3RMQlHK0FB7HVc9Bch13hftxe2+0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    rebulk
    babelfish
    python-dateutil
  ];

  pythonImportsCheck = [ "guessit" ];

  meta = {
    description = "Python library that extracts as much information as possible from a video filename";
    homepage = "https://guessit-io.github.io/guessit/";
    license = lib.licenses.lgpl3Only;
  };
}
