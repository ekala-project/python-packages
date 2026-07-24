{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "elementpath";
  version = "5.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NemMwuJjMjBaSbMuquv7conRljyI05if9cywLEaAmCA=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "elementpath" ];

  meta = {
    homepage = "https://github.com/sissaschool/elementpath";
    description = "XPath 1.0/2.0/3.0/3.1 parsers and selectors for ElementTree and lxml";
    license = lib.licenses.mit;
  };
}
