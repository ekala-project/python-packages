{
  lib,
  buildPythonPackage,
  fetchPypi,
  httplib2,
  lazr-restfulclient,
  lazr-uri,
  setuptools_80,
  pysocks,
}:

buildPythonPackage (finalAttrs: {
  pname = "launchpadlib";
  version = "2.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-o5JhYyuqBghy9l/hSais1uGtpVlk7hr8nyWRXjuV5os=";
  };

  build-system = [ setuptools_80 ];

  dependencies = [
    httplib2
    lazr-restfulclient
    lazr-uri
    pysocks
  ];

  pythonImportsCheck = [ "launchpadlib" ];

  meta = {
    description = "Script Launchpad through its web services interfaces. Officially supported";
    homepage = "https://help.launchpad.net/API/launchpadlib";
    license = lib.licenses.lgpl3Only;
  };
})
