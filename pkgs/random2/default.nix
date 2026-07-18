{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "random2";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-NK0wqsNBA5hyQBWV35qyydw20LfAd9sc6preQw7RwAc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "random2" ];

  meta = {
    description = "Python 3 compatible Python 2 random Module";
    homepage = "http://pypi.org/pypi/random2/";
    license = lib.licenses.psfl;
  };
}
