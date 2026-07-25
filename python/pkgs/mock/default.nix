{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mock";
  version = "5.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TkYOgYYptLFz8y0IvzDTr4Ejr7uOBLtXB6H9R5nlA/A=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "mock" ];

  meta = {
    description = "Rolling backport of unittest.mock for all Pythons";
    homepage = "https://github.com/testing-cabal/mock";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
