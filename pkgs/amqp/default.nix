{
  lib,
  buildPythonPackage,
  fetchPypi,
  vine,
}:

buildPythonPackage rec {
  pname = "amqp";
  version = "5.3.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zdwAxyVElSICO62Un3D/97SPCxredNFwpvEKsERzlDI=";
  };

  propagatedBuildInputs = [ vine ];

  pythonImportsCheck = [ "amqp" ];

  meta = {
    description = "Python client for the Advanced Message Queuing Procotol (AMQP). This is a fork of amqplib which is maintained by the Celery project";
    homepage = "https://github.com/celery/py-amqp";
    license = lib.licenses.bsd3;
  };
}
