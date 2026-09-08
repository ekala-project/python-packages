{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pika";
  version = "1.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jPyLM6XLFuczvWDP/KlzLA0ddh7NgKifNO198s041tY=";
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
