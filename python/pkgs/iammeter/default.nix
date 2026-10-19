{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "iammeter";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Q0o392Xf3cY5BkX4ic6pE3XKMSgek5cpW4TMqSh+Ew8=";
  };

  build-system = [ setuptools ];

  # Module has no tests

  pythonImportsCheck = [ "iammeter" ];

  meta = {
    description = "Module to work with the IamMeter API";
    homepage = "https://pypi.org/project/iammeter/";
    license = lib.licenses.mit;
  };
}
