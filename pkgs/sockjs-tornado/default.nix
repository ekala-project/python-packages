{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  tornado,
}:

buildPythonPackage rec {
  pname = "sockjs-tornado";
  version = "1.0.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Av8lRms6RrGn2+R3NAsEJ3CsB43n6kdaYoWiinXrH6s=";
  };

  build-system = [ setuptools ];

  dependencies = [ tornado ];

  pythonImportsCheck = [ "sockjs" ];

  meta = {
    description = "SockJS python server implementation on top of Tornado framework";
    homepage = "https://github.com/mrjoes/sockjs-tornado/";
    license = lib.licenses.mit;
  };
}
