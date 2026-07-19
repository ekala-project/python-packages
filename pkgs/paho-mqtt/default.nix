{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "paho-mqtt";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "paho_mqtt";
    inherit version;
    hash = "sha256-EtbnUR1BN1VaP26hZ66EavLHNXsQvG+k98OWj8FyODQ=";
  };

  build-system = [ hatchling ];

  doCheck = false;

  pythonImportsCheck = [ "paho.mqtt" ];

  meta = {
    description = "MQTT version 5.0/3.1.1 client class";
    homepage = "https://eclipse.org/paho";
    license = lib.licenses.epl20;
  };
}
