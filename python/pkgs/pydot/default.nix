{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pyparsing,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydot";
  version = "4.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-whSPaBxKM+CL8OJqnl+OQJmoLg4qBoCY8yzoZXc2StU=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyparsing ];

  pythonImportsCheck = [ "pydot" ];

  meta = {
    description = "Python interface to Graphviz's Dot language";
    homepage = "https://github.com/pydot/pydot";
    license = lib.licenses.mit;
  };
})
