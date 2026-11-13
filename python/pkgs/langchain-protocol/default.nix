{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-protocol";
  version = "0.0.21";
  pyproject = true;

  src = fetchPypi {
    pname = "langchain_protocol";
    inherit (finalAttrs) version;
    hash = "sha256-BLPoCFIjOo2zmznTrSQ42JJTHcDs1BRZ6FehOe4OYBw=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"hatchling>=1.26,<1.30"' '"hatchling>=1.26"'
  '';

  build-system = [ hatchling ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "langchain_protocol" ];

  meta = {
    description = "Python bindings for the LangChain agent streaming protocol";
    homepage = "https://pypi.org/project/langchain-protocol";
    license = lib.licenses.mit;
  };
})
