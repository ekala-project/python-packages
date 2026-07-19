{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "locket";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XA1MBSqLu/dQ4Fao5lzNMJCG9PDxii6sMGqN+kESpjI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "locket" ];

  meta = {
    homepage = "https://github.com/mwilliamson/locket.py";
    description = "Library which provides a lock that can be used by multiple processes";
    license = lib.licenses.bsd2;
  };
}
