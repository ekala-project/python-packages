{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "luhn";
  version = "0.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mmcloughlin";
    repo = "luhn";
    tag = finalAttrs.version;
    hash = "sha256-ZifaCjOVhWdXuzi5n6V+6eVN5vrEHKgUdpSOXoMyR18=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  enabledTestPaths = [ "test.py" ];

  pythonImportsCheck = [ "luhn" ];

  meta = {
    description = "Python module for generate and verify Luhn check digits";
    homepage = "https://github.com/mmcloughlin/luhn";
    license = lib.licenses.mit;
  };
})
