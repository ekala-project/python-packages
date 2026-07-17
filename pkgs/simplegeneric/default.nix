{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "simplegeneric";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3JcuBglLmvW4VbPfSmRjleQ9HJ0NOe00W3OTVg0LkXM=";
    extension = "zip";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "simplegeneric" ];

  meta = {
    description = "Simple generic functions";
    homepage = "http://cheeseshop.python.org/pypi/simplegeneric";
    license = lib.licenses.zpl21;
  };
}
