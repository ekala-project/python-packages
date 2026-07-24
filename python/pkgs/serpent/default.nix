{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "serpent";
  version = "1.43";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YtwkL9TqKlAzn09aqvbsxVYF7nR3DX6yAx52DZCg0RQ=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "serpent" ];

  meta = {
    description = "Simple serialization library based on ast.literal_eval";
    homepage = "https://github.com/irmen/Serpent";
    license = lib.licenses.mit;
  };
}
