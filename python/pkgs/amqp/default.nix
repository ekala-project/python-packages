{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  vine,
}:

buildPythonPackage (finalAttrs: {
  pname = "amqp";
  version = "5.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-k2JmDEoxFQzxjnjK4s6Koekp/GxnOeafbdXb6pw+3II=";
  };

  build-system = [ setuptools ];

  dependencies = [ vine ];

  pythonImportsCheck = [ "amqp" ];

  meta = {
    description = "Python client for the Advanced Message Queuing Procotol (AMQP). This is a fork of amqplib which is maintained by the Celery project";
    homepage = "https://github.com/celery/py-amqp";
    license = lib.licenses.bsd3;
  };
})
