{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pycotap";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Z0NV8BMAvgPff4cXhOSYZSwtiawZzXfujmFlJjSi+Do=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pycotap" ];

  meta = {
    description = "Test runner for unittest that outputs TAP results to stdout";
    homepage = "https://el-tramo.be/pycotap";
    license = lib.licenses.mit;
  };
}
