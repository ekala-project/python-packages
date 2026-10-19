{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  vine,
}:

buildPythonPackage rec {
  pname = "amqp";
  version = "5.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zdwAxyVElSICO62Un3D/97SPCxredNFwpvEKsERzlDI=";
  };

  build-system = [ setuptools ];

  dependencies = [ vine ];

  pythonImportsCheck = [ "amqp" ];

  meta = {
    description = "Python client for the Advanced Message Queuing Procotol (AMQP). This is a fork of amqplib which is maintained by the Celery project";
    homepage = "https://github.com/celery/py-amqp";
    license = lib.licenses.bsd3;
  };
}
