{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pika";
  version = "1.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6FHz5Jkq37+Otk6bhtlOM4L5K6AgAFWr7bspZ2uOcTs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pika" ];

  doCheck = false;

  meta = {
    description = "Pure-Python implementation of the AMQP 0-9-1 protocol";
    homepage = "https://pika.readthedocs.org";
    license = lib.licenses.bsd3;
  };
}
