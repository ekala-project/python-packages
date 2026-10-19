{
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cryptography,
  python-dateutil,
  pbr,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyghmi";
  version = "1.6.19";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-MKCy4UWj5DKcjYaUhjXu47NHnsan7LxMw1B+bfP+WcI=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    cryptography
    python-dateutil
  ];

  pythonImportsCheck = [ "pyghmi" ];

})
