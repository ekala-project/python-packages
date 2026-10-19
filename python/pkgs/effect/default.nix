{
  lib,
  attrs,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytestCheckHook,
  six,
  testtools,
}:

buildPythonPackage (finalAttrs: {
  pname = "effect";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ev+2A3B8ZIsHsReB67eTpLmu6KzxrFdkw+0hEq3wyeo=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace effect/test_do.py \
      --replace "py.test" "pytest"
  '';

  dependencies = [
    attrs
    six
  ];

  nativeCheckInputs = [
    pytestCheckHook
    testtools
  ];

  pythonImportsCheck = [ "effect" ];

  meta = {
    description = "Pure effects for Python";
    homepage = "https://effect.readthedocs.io/";
    license = lib.licenses.mit;
  };
})
