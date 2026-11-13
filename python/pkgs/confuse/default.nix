{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  pyyaml,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "confuse";
  version = "2.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-tRzTPDYxnPirS63oHRbfPnE1rwH/o/UaYOExudUVbNM=";
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
})
