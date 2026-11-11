{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "paho-mqtt";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "paho_mqtt";
    inherit (finalAttrs) version;
    hash = "sha256-vPcG8D8fSeD8OuFm3Htn7jVGNJb4vf18nDYYH2umNck=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "paho.mqtt" ];

  meta = {
    description = "MQTT version 5.0/3.1.1 client class";
    homepage = "https://eclipse.org/paho";
    license = lib.licenses.epl20;
  };
})
