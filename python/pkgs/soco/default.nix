{
  lib,
  appdirs,
  buildPythonPackage,
  fetchFromGitHub,
  ifaddr,
  lxml,
  requests,
  setuptools,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "soco";
  version = "0.31.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SoCo";
    repo = "SoCo";
    tag = "v${version}";
    hash = "sha256-YxIpTFGB82aBvRxfntou2dUZm7T0KSj7yhX3gcdAO7U=";
  };

  build-system = [ setuptools ];

  dependencies = [
    appdirs
    ifaddr
    lxml
    requests
    xmltodict
  ];

  pythonImportsCheck = [ "soco" ];

  meta = {
    description = "CLI and library to control Sonos speakers";
    homepage = "http://python-soco.com/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
