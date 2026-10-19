{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "goalzero";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-h/EaEOe0zvnO5BYfcIyC3Vq8sPED6ts1IeI/GM+vm7c=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  # no tests implemented

  pythonImportsCheck = [ "goalzero" ];

  meta = {
    description = "Goal Zero Yeti REST Api Library";
    homepage = "https://github.com/tkdrob/goalzero";
    license = lib.licenses.mit;
  };
}
