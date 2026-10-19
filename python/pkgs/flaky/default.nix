{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "flaky";
  version = "3.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-RyBKgeyQXz1az71h2uq8raj51AMWFtm8sGGEYXKWmfU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "flaky" ];

  meta = {
    homepage = "https://github.com/box/flaky";
    description = "Plugin for nose or py.test that automatically reruns flaky tests";
    license = lib.licenses.asl20;
  };
})
