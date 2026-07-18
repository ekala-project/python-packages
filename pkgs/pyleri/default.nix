{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyleri";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BxWkM+W5fj0v2PdLTleHHjZes6HHoJ+3DS94cA/SXkw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyleri" ];

  meta = {
    description = "Module to parse SiriDB";
    homepage = "https://github.com/cesbit/pyleri";
    license = lib.licenses.mit;
  };
}
