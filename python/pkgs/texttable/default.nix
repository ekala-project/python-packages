{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "texttable";
  version = "1.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3BbqazX79Skbpu9515432bPKas17rjyjRQSI18LhnJk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "texttable" ];

  meta = {
    description = "Module to generate a formatted text table, using ASCII characters";
    homepage = "https://github.com/foutaise/texttable";
    license = lib.licenses.mit;
  };
})
