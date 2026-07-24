{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "power";
  version = "1.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fX1g7DMqy+On0AN5tF45q/ZQv37jEdYdpauSH1LwYPA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "power" ];

  meta = {
    description = "Cross-platform system power status information";
    homepage = "https://github.com/Kentzo/Power";
    license = lib.licenses.mit;
  };
}
