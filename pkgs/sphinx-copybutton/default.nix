{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-copybutton";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TPF8gvuWRtG8nKkqwoCBOjtgXYxCEiX9mRMVQQPuH70=";
  };

  build-system = [ setuptools ];

  dependencies = [ sphinx ];

  pythonImportsCheck = [ "sphinx_copybutton" ];

  meta = {
    homepage = "https://github.com/executablebooks/sphinx-copybutton";
    description = "Small sphinx extension to add a \"copy\" button to code blocks";
    license = lib.licenses.mit;
  };
}
