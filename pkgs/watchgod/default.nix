{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  anyio,
}:

buildPythonPackage rec {
  pname = "watchgod";
  version = "0.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yxH/ZmV777qU2CjjtiLV+3byL72hN281Xz5uUel9lFA=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "anyio" ];

  dependencies = [ anyio ];

  pythonImportsCheck = [ "watchgod" ];

  meta = {
    description = "Simple, modern file watching and code reload in python";
    homepage = "https://github.com/samuelcolvin/watchgod";
    license = lib.licenses.mit;
  };
}
