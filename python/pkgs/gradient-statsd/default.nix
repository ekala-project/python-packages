{
  lib,
  buildPythonPackage,
  certifi,
  chardet,
  datadog,
  decorator,
  fetchPypi,
  # build-system
  setuptools,
  idna,
  requests,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "gradient-statsd";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "gradient_statsd";
    inherit (finalAttrs) version;
    hash = "sha256-iWlNX43ZtvU73wz4+8DgDulQNOnssJGxTBkvAaLj530=";
  };

  build-system = [ setuptools ];

  dependencies = [
    certifi
    chardet
    datadog
    decorator
    idna
    requests
    urllib3
  ];

  pythonImportsCheck = [ "gradient_statsd" ];

  # Pypi does not contain tests

  meta = {
    description = "Wrapper around the DogStatsd client";
    homepage = "https://paperspace.com";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
  };
})
