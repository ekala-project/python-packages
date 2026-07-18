{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "langchain-protocol";
  version = "0.0.18";
  pyproject = true;

  src = fetchPypi {
    pname = "langchain_protocol";
    inherit version;
    hash = "sha256-7D4ReC8e0MnbOOWp7QGw56DT+6QG+qiu9llLc8VqY+Y=";
  };

  build-system = [ hatchling ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "langchain_protocol" ];

  meta = {
    description = "Python bindings for the LangChain agent streaming protocol";
    homepage = "https://pypi.org/project/langchain-protocol";
    license = lib.licenses.mit;
  };
}
