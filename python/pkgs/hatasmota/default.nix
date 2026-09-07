{
  lib,
  aiohttp,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,
  setuptools,
  voluptuous,
}:

buildPythonPackage rec {
  pname = "hatasmota";
  version = "0.10.2";
  pyproject = true;

  disabled = pythonOlder "3.13";

  src = fetchFromGitHub {
    owner = "emontnemery";
    repo = "hatasmota";
    tag = version;
    hash = "sha256-IIOXpgBlXzeOUCvyEYAuEYzvoCKzhWSud1GbgTpa8wU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    attrs
    voluptuous
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [ "hatasmota" ];

  meta = {
    description = "Python module to help parse and construct Tasmota MQTT messages";
    homepage = "https://github.com/emontnemery/hatasmota";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
