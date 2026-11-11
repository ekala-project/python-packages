{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "awacs";
  version = "2.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-bM8PMgxHZs8eAjo5cpyxKL1E2ByM1Q7D/tC9QJovkFU=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "awacs" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = {
    description = "AWS Access Policy Language creation library";
    homepage = "https://github.com/cloudtools/awacs";
    license = lib.licenses.bsd2;
  };
})
