{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  pyyaml,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "confuse";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jnYAwyYYUhIutfF7JLBquOVDeyHWIkhTwUIMOKxGnTw=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pyyaml
    typing-extensions
  ];

  pythonImportsCheck = [ "confuse" ];

  meta = {
    description = "Python configuration library that uses YAML";
    homepage = "https://github.com/beetbox/confuse";
    license = lib.licenses.mit;
  };
}
