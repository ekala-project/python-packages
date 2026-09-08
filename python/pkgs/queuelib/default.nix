{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "queuelib";
  version = "1.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BjyCHDKFmui9zizJ50FWZFwHQhikZPgmLimjuN6Dlzc=";
  };

  build-system = [ hatchling ];

  doCheck = false;

  pythonImportsCheck = [ "queuelib" ];

  meta = {
    description = "Collection of persistent (disk-based) queues for Python";
    homepage = "https://github.com/scrapy/queuelib";
    license = lib.licenses.bsd3;
  };
}
