{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pika";
  version = "1.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SNH1Apfna+T8eY/VIy1NUy16R1jlH3wK5sQAS5gIoms=";
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
