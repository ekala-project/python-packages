{
  lib,
  buildPythonPackage,
  fetchPypi,
  mock,
  parameterized,
  python-dateutil,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "vertica-python";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VCB4ri/t7mlK3tsE2Bxu3Cd7h+10QDApQhB9hqC81EU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    six
  ];
  pythonImportsCheck = [ "vertica_python" ];

  meta = {
    description = "Native Python client for Vertica database";
    homepage = "https://github.com/vertica/vertica-python";
    license = lib.licenses.asl20;
  };
})
