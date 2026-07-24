{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
  zeroconf,
}:

buildPythonPackage rec {
  pname = "netdisco";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TbtZBILzd8zEYeAXQnB8y+jx0tGyhXivkdybf+vNy9I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    zeroconf
  ];

  pythonImportsCheck = [ "netdisco" ];

  meta = {
    description = "Python library to scan local network for services and devices";
    homepage = "https://github.com/home-assistant/netdisco";
    license = lib.licenses.asl20;
  };
}
